import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mykuri/presentation/get_started_screen/get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => GetStartedScreen(),
    //     )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: SvgPicture.asset("assets/images/logo.svg"),
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
