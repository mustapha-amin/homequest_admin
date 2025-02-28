part of 'dashboard_exports.dart';

class MainDashboard extends ConsumerStatefulWidget {
  final double width;
  const MainDashboard({super.key, required this.width});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainDashboardState();
}

class _MainDashboardState extends ConsumerState<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GridView(
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
        DashboardTile(title: 'Properties', icon: Iconsax.home, count: 200),
        DashboardTile(title: 'Agents', icon: Icons.verified, count: 50),
        DashboardTile(title: 'Customers', icon: Iconsax.user, count: 500),
      ],
    ).padAll(5);
  }
}
