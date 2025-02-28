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
    return Card.filled(
      elevation: 1,
      color: const Color.fromARGB(255, 243, 231, 212),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20.sp, color: Appcolor.brown),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    title,
                    style: kTextStyle(15.sp, color: Appcolor.brown),
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
                color: Appcolor.brown,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
