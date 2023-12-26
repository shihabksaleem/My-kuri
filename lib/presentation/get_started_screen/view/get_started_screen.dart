import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/presentation/login_screen/view/login_screen.dart';

import 'package:mykuri/presentation/registration_screen/view/registration_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              Column(
                children: [
                  Hero(
                    tag: 'logo',
                    child: Center(
                      child: SizedBox(
                        height: 150,
                        width: 170,
                        child: SvgPicture.asset("assets/images/logo.svg"),
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  Text('Welcome to My Kuri',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
                  SizedBox(height: 8),
                  Text('Only who have referral code',
                      style: TextStyle(fontSize: 15))
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: ColorConstant.mykuriPrimaryBlue,
                      ),
                      child: Center(
                        child: Text(
                          "Register your account".toUpperCase(),
                          style: TextStyle(
                              color: ColorConstant.mykuriWhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: ColorConstant.mykuriGrey,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "log into your account".toUpperCase(),
                          style: TextStyle(
                              color: ColorConstant.mykuriTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
