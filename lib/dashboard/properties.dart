part of 'dashboard_exports.dart';

class Properties extends ConsumerStatefulWidget {
  final double width;
  const Properties({required this.width, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PropertiesState();
}

class _PropertiesState extends ConsumerState<Properties> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text("Properties", style: kTextStyle(20)),
        ),
        Expanded(
          child: ref
              .watch(fetchListingsProvider)
              .when(
                data: (properties) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          widget.width > 1120
                              ? 4
                              : widget.width < 1120 && widget.width > 600
                              ? 3
                              : 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1.4,
                    ),
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      return PropertyListingWidget(
                        propertyListing: properties[index],
                      );
                    },
                  ).padAll(5);
                },
                loading: () =>GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        widget.width > 1120
                            ? 4
                            : widget.width < 1120 && widget.width > 600
                            ? 3
                            : 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.4,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Skeletonizer(
                      child: PropertyListingWidget(
                        propertyListing: PropertyListing(
                          imagesUrls: [
                            "https://images.unsplash.com/photo-1612838320302-4b3b3b3b3b3b",
                          ],
                          price: 100000,
                          address: "1234, Random Street, Random City",
                          agentFee: 2,
                          id: 's',
                          agentID: 's',
                          propertyType: PropertyType.apartment,
                          propertySize: 20,
                          listingType: ListingType.rent,
                          kitchens: 2,
                          sittingRooms: 2,
                          condition: Condition.all,
                          facilities: [],
                          furnishing: Furnishing.furnished,
                          propertySubtype: PropertySubtype.detached,
                          geoPoint: GeoPoint(2, 2),
                          state: '',
                          lga: '',
                          available: true,
                          bedrooms: 3,
                          bathrooms: 2,
                        ),
                      ),
                    );
                  },
                ).padAll(5),
                error:
                    (error, stackTrace) =>
                        Center(child: Text(error.toString())),
              ),
        ),
      ],
    );
  }
}
