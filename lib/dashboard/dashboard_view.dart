import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homequest_admin/core/enums.dart';
import 'package:homequest_admin/core/extensions.dart';
import 'package:homequest_admin/dashboard/dashboard.dart';
import 'package:homequest_admin/sidebar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sizer/sizer.dart';

import 'dashboard_exports.dart';

class DashboardView extends ConsumerStatefulWidget {
  final bool canShowSidebar;
  const DashboardView({required this.canShowSidebar, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.canShowSidebar)
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
            SideMenuItem.property_listings => Properties(width: 100.w),
            SideMenuItem.users => UserManagementScreen(
              isFullScreen: context.screenWidth < 900,
            ),
          },
        ),
      ],
    );
  }
}
