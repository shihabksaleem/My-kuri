import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mykuri/core/app_utils.dart';
import 'package:mykuri/presentation/bottom_nav_screen/view/bottom_nav_screen.dart';
import 'package:mykuri/presentation/get_started_screen/view/get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      final token = await AppUtils.getAccessKey();

      if (token != null && token.isNotEmpty) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavScreen(),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GetStartedScreen(),
            ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Hero(
            tag: 'logo',
            child: Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: SvgPicture.asset("assets/images/logo.svg"),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/companyLogo.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Founding Member"),
                      Text(
                        "Rahul Jewellery",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              )
            ],
          )
        ],
      ),
    );
  }
}
