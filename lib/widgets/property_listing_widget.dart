import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homequest_admin/core/extensions.dart';
import 'package:homequest_admin/core/utils/textstyle.dart';
import 'package:homequest_admin/models/property_listing.dart';
import 'package:homequest_admin/services/user_data.dart';

class PropertyListingWidget extends ConsumerStatefulWidget {
  final PropertyListing propertyListing;
  const PropertyListingWidget({required this.propertyListing, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PropertyListingWidgetState();
}

class _PropertyListingWidgetState extends ConsumerState<PropertyListingWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                widget.propertyListing.imagesUrls[0],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text:
                          "${widget.propertyListing.propertyType.name.captializeFirst} ",
                      children: [
                        TextSpan(
                          text:
                              "- for ${widget.propertyListing.listingType.name}",
                          style: kTextStyle(16, color: Colors.grey),
                        ),
                      ],
                    ),
                    style: kTextStyle(16, isBold: true),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                widget.propertyListing.price.toMoney,
                style: kTextStyle(16, color: Colors.green),
              ),
              SizedBox(height: 8),
              Text(
                "${widget.propertyListing.lga}, ${widget.propertyListing.state}",
                style: kTextStyle(14, color: Colors.grey),
              ),
              SizedBox(height: 8),
              ref
                  .watch(
                    fetchAgentDetailProvider(widget.propertyListing.agentID),
                  )
                  .when(
                    data: (agent) {
                      return Text(
                        "By ${agent.name}",
                        style: kTextStyle(14, color: Colors.grey),
                      );
                    },
                    loading: () => Text("By: Loading..."),
                    error: (error, _) => Text("Error loading agent"),
                  ),
            ],
          ).padAll(8),
        ],
      ),
    );
  }
}
