import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homequest_admin/core/enums.dart';
import 'package:homequest_admin/core/extensions.dart';
import 'package:homequest_admin/dashboard/dashboard_view.dart';
import 'package:homequest_admin/sidebar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sizer/sizer.dart';

final currentViewProvider = StateProvider((ref) {
  return SideMenuItem.dashboard;
});

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: width < 900 ? SideBar() : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          width > 900 ? SizedBox(width: 20.w, child: SideBar()) : SizedBox(),
          Expanded(child: DashboardView(canShowSidebar: width < 900)),
        ],
      ).padY(5),
    );
  }
}
