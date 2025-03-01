import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homequest_admin/core/enums.dart';
import 'package:homequest_admin/core/utils/appcolor.dart';
import 'package:homequest_admin/core/utils/textstyle.dart';
import 'package:homequest_admin/dashboard/dashboard.dart';
import 'package:sizer/sizer.dart';

class SideBar extends ConsumerStatefulWidget {
  SideBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SideBarState();
}

class _SideBarState extends ConsumerState<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              backgroundImage: AssetImage('assets/admin.png'),
            ),
            Text("Welcome, Admin", style: kTextStyle(20)),
            SizedBox(height: 20),
            ...SideMenuItem.values.map(
              (item) => Stack(
                alignment: Alignment.center,
                children: [
                  if (ref.watch(currentViewProvider) == item)
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 5,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 231, 212),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ListTile(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    title: Text(
                      item.name,
                      style: kTextStyle(12, color: Colors.black),
                    ),
                    leading: Icon(item.icon, color: Colors.black, size: 20),
                    onTap: () {
                      ref.read(currentViewProvider.notifier).state = item;
                    },
                  ),
                ],
              ),
            ),
            //Text(MediaQuery.of(context).size.width.toString()),
          ],
        ),
      ),
    );
  }
}
