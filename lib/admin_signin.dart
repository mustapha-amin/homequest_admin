import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:homequest_admin/core/extensions.dart';
import 'package:homequest_admin/core/utils/textstyle.dart';
import 'package:homequest_admin/dashboard/dashboard.dart';

class AdminSignInScreen extends StatelessWidget {
  const AdminSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        spacing: 30,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome, Admin", style: kTextStyle(25, isBold: true)),
          SizedBox(
            width:
                context.screenWidth < 900
                    ? context.screenWidth * .7
                    : context.screenWidth * .3,
            height: context.screenHeight * .4,
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Admin Avatar
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/admin.png',
                    ), // Replace with your asset
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Admin Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sign In Button
                  SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        if (passwordController.text.isNotEmpty &&
                            passwordController.text == "Adminxyz") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          );
                        } else {
                          Flushbar(
                            maxWidth: 300,
                            margin: EdgeInsets.all(5),
                            backgroundColor: Colors.red,
                            flushbarPosition: FlushbarPosition.TOP,
                            borderRadius: BorderRadius.circular(2),
                            message: "Enter a valid password",
                            duration: Duration(milliseconds: 1400),
                          )..show(context);
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: kTextStyle(15, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ).centeralize().padAll(24),
            ),
          ).centeralize(),
        ],
      ),
    );
  }
}
