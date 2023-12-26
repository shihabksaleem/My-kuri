import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/textfield_refactor.dart';
import 'package:mykuri/presentation/bottom_nav_screen/view/bottom_nav_screen.dart';

import 'package:pinput/pinput.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.mykuriWhite,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorConstant.mykuriTextColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text('Recover password',
                  style: TextStyle(
                      fontSize: 35,
                      color: ColorConstant.mykuriPrimaryBlue,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Please enter your new password to continue"),
              SizedBox(height: 70),
              RefactoredTextField(name: "New Password"),
              RefactoredTextField(name: "Repeat password"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: ColorConstant.mykuriPrimaryBlue,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Change password".toUpperCase(),
                    style: TextStyle(
                        color: ColorConstant.mykuriWhite,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
