import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homequest_admin/core/enums.dart';
import 'package:homequest_admin/core/utils/appcolor.dart';
import 'package:homequest_admin/core/utils/textstyle.dart';
import 'package:homequest_admin/dashboard.dart';
import 'package:sizer/sizer.dart';

class SideBar extends ConsumerStatefulWidget {
  const SideBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SideBarState();
}

class _SideBarState extends ConsumerState<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 30.w,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              backgroundImage: AssetImage('assets/admin.png'),
            ),
            Text("Welcome, Admin", style: kTextStyle(20)),
            SizedBox(height: 20),
            ...SideMenuItem.values.map(
              (item) => Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color:
                        item == ref.watch(currentViewProvider)
                            ? Appcolor.blue
                            : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    item.name,
                    style: kTextStyle(15, color: Colors.black),
                  ),
                  leading: Icon(item.icon, color: Colors.black),
                  onTap: () {
                    ref.read(currentViewProvider.notifier).state = item;
                  },
                ),
              ),
            ),
            //Text(MediaQuery.of(context).size.width.toString()),
          ],
        ),
      ),
    );
  }
}
