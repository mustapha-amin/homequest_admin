import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homequest_admin/core/enums.dart';
import 'package:homequest_admin/dashboard.dart';
import 'package:homequest_admin/sidebar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sizer/sizer.dart';

import 'dashboard_exports.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Iconsax.menu_1_copy),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          Expanded(
            child: switch (ref.watch(currentViewProvider)) {
              SideMenuItem.dashboard => MainDashboard(width: 100.w),
              SideMenuItem.property_listings => Properties(),
              SideMenuItem.reports => Reports(),
              SideMenuItem.settings => Settings(),
              SideMenuItem.users => UserManagementScreen(),
            },
          ),
        ],
      ),
    );
  }
}
