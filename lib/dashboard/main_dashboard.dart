part of 'dashboard_exports.dart';

class MainDashboard extends ConsumerStatefulWidget {
  final double width;
  const MainDashboard({super.key, required this.width});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainDashboardState();
}

class _MainDashboardState extends ConsumerState<MainDashboard> {
  List<String> agentNames = [
    "James Carter",
    "Michael Thompson",
    "David Rodriguez",
    "John Martinez",
    "Robert Wilson",
    // Add more names here...
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  width > 900
                      ? 4
                      : width < 900 && width > 600
                      ? 3
                      : 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: width > 900 ? 1.4 : 1.2,
            ),
            children: <Widget>[
              DashboardTile(
                title: 'Properties',
                icon: Iconsax.buildings_2,
                count: ref
                    .watch(fetchListingsProvider)
                    .when(
                      data: (list) => list.length,
                      error: (e, stk) => 0,
                      loading: () => 0,
                    ),
              ),
              DashboardTile(
                title: 'Agents',
                icon: Icons.verified,
                count: ref
                    .watch(fetchUsersProvider)
                    .when(
                      data:
                          (users) =>
                              users
                                  .where(
                                    (user) => user.runtimeType == AgentModel,
                                  )
                                  .length,
                      error: (e, stk) => 0,
                      loading: () => 0,
                    ),
              ),
              DashboardTile(
                title: 'Customers',
                icon: Iconsax.user,
                count: ref
                    .watch(fetchUsersProvider)
                    .when(
                      data:
                          (users) =>
                              users
                                  .where(
                                    (user) => user.runtimeType == ClientModel,
                                  )
                                  .length,
                      error: (e, stk) => 0,
                      loading: () => 0,
                    ),
              ),
            ],
          ).padAll(5),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top Agents',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://picsum.photos/${index + 20}",
                          ),
                        ),
                        title: Text(agentNames[index]),
                        subtitle: Text(
                          "Properties Sold: ${(50 - (index * 2))}",
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ).padX(5),

          ref
              .watch(fetchListingsProvider)
              .when(
                data: (listings) {
                  return syncf.SfCartesianChart(
                    primaryXAxis: syncf.CategoryAxis(
                      title: syncf.AxisTitle(text: 'States'),
                    ),
                    primaryYAxis: syncf.NumericAxis(
                      title: syncf.AxisTitle(text: 'Number of listings'),
                      interval: 10,
                      maximum: 100,
                    ),
                    series: <syncf.BarSeries<PropertyListing, String>>[
                      syncf.BarSeries<PropertyListing, String>(
                        dataSource: listings,
                        xValueMapper:
                            (PropertyListing listing, _) => listing.state,
                        yValueMapper:
                            (PropertyListing listing, _) =>
                                listings
                                    .where(
                                      (listingy) =>
                                          listingy.state == listing.state,
                                    )
                                    .length,
                        color: Appcolor.brown,
                        dataLabelSettings: syncf.DataLabelSettings(
                          isVisible: true,
                        ),
                      ),
                    ],
                    tooltipBehavior: syncf.TooltipBehavior(enable: true),
                  );
                },
                error: (e, s) {
                  return Text("Error: $e");
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },
              ),
        ],
      ),
    );
  }
}
