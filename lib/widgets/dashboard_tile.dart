import 'package:flutter/material.dart';
import 'package:homequest_admin/core/extensions.dart';
import 'package:homequest_admin/core/utils/appcolor.dart';
import 'package:homequest_admin/core/utils/textstyle.dart';
import 'package:sizer/sizer.dart';

class DashboardTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final int count;

  const DashboardTile({
    required this.title,
    required this.icon,
    required this.count,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Appcolor.blue,
      ),
      padding: EdgeInsets.all(2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20.sp, color: Colors.white),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  title,
                  style: kTextStyle(15.sp, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Text(
            count.toString(),
            style: kTextStyle(
              20.sp,
              color: Colors.white,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
