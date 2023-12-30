import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/presentation/edit_profile_screen/view/edit_profile_screen.dart';
import 'package:mykuri/presentation/login_screen/view/login_screen.dart';

import 'package:mykuri/presentation/profile_screen/view/widgets/profile_detail_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 65),
                Text("Profile",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                SizedBox(height: 15),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      "https://image.winudf.com/v2/image1/bmV0LndsbHBwci5ib3lzX3Byb2ZpbGVfcGljdHVyZXNfc2NyZWVuXzBfMTY2NzUzNzYxN18wOTk/screen-0.webp?fakeurl=1&type=.webp"),
                ),
                SizedBox(height: 15),
                Text(
                  "Joseph Kalu",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                SizedBox(
                  height: 30,
                ),
                // here is the personal information
                Text("Personal information",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                ProfileDetailCard(
                  titile: "Phone number",
                  value: "+ 234 808 762 1236",
                ),
                ProfileDetailCard(
                  titile: "Email",
                  value: "josephkalu@gmail.com",
                ),
                ProfileDetailCard(
                  titile: "User Name",
                  value: "joseph123",
                ),
                ProfileDetailCard(
                  titile: "DOB",
                  value: "12-02-1990",
                ),
                ProfileDetailCard(
                  titile: "Address",
                  value: "Mavoor, Calicut",
                ),
                SizedBox(
                  height: 30,
                ),
                // here is the Nominee details
                Text("Nominee details",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                ProfileDetailCard(
                  titile: "Name",
                  value: "Joseph Kalu",
                ),
                ProfileDetailCard(
                  titile: "Relation",
                  value: "Brother",
                ),
                ProfileDetailCard(
                  titile: "DOB",
                  value: "10-06-1994",
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    height: 40,
                    child: Center(
                        child: Text("EDIT",
                            style: TextStyle(
                                color: ColorConstant.mykuriWhite,
                                fontWeight: FontWeight.bold))),
                    color: ColorConstant.mykuriPrimaryBlue,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    height: 40,
                    child: Center(
                        child: Text("lOG OUT",
                            style: TextStyle(
                                color: ColorConstant.mykuriTextColor,
                                fontWeight: FontWeight.bold))),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
