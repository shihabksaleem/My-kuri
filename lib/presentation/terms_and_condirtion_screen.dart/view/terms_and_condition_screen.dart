import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/presentation/bottom_nav_screen/view/bottom_nav_screen.dart';
import 'package:mykuri/presentation/terms_and_condirtion_screen.dart/view/widgets/radiobutton_card.dart';
import 'package:mykuri/presentation/terms_and_condirtion_screen.dart/view/widgets/t&c_data_container.dart';

class TermsAndCondtions extends StatefulWidget {
  const TermsAndCondtions({super.key});

  @override
  State<TermsAndCondtions> createState() => _TermsAndCondtionsState();
}

class _TermsAndCondtionsState extends State<TermsAndCondtions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                color: ColorConstant.mykuriTextColor,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text('Terms & Conditions',
                style: TextStyle(
                    fontSize: 35,
                    color: ColorConstant.mykuriPrimaryBlue,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TAndCDataContainer(
              titile: 'Summary',
              des:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. t velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. t velit esse cillum dolore eu fugiat nulla pariatur. ',
            ),
            SizedBox(height: 10),
            TAndCDataContainer(
              titile: 'Terms',
              des:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. t velit esse cillum dolore eu fugiat nulla pariatur.  ',
            ),
            SizedBox(height: 10),
            TAndCDataContainer(
              titile: 'Conditions',
              des:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            ),
            SizedBox(height: 30),
            radioButtonContainer(
                title: "Lorem ipsum dolor sit amet, consectetur"),
            SizedBox(height: 10),
            radioButtonContainer(
                title: "Lorem ipsum dolor sit amet, consectetur")
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavScreen(),
                ),
                (route) => false);
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorConstant.mykuriPrimaryBlue,
            ),
            child: Center(
              child: Text(
                "agree".toUpperCase(),
                style: TextStyle(
                    color: ColorConstant.mykuriWhite,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
