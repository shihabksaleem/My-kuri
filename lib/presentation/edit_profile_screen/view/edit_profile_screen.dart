import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/textfield_refactor.dart';
import 'package:mykuri/presentation/bottom_nav_screen/view/bottom_nav_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                SizedBox(height: 65),
                Text("Profile",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                SizedBox(height: 15),
                Container(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            "https://image.winudf.com/v2/image1/bmV0LndsbHBwci5ib3lzX3Byb2ZpbGVfcGljdHVyZXNfc2NyZWVuXzBfMTY2NzUzNzYxN18wOTk/screen-0.webp?fakeurl=1&type=.webp"),
                      ),
                      Positioned(
                        right: 0,
                        child: Icon(
                          Icons.edit_square,
                          color: ColorConstant.mykuriPrimaryBlue,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Joseph Kalu",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.edit_square,
                      color: ColorConstant.mykuriPrimaryBlue,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Personal information",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                RefactoredTextField(
                  name: "Phone number",
                  hinttext: "+ 234 808 762 1236",
                ),
                RefactoredTextField(
                  name: "Email",
                  hinttext: "josephkalu@gmail.com",
                ),
                RefactoredTextField(
                  name: "Username",
                  hinttext: "joseph123",
                ),
                RefactoredTextField(
                  name: "DOB",
                  hinttext: "12-02-1990",
                ),
                RefactoredTextField(
                  name: "Address",
                  hinttext: "Mavoor, Calicut",
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Nominee details",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                RefactoredTextField(
                  name: "Name",
                  hinttext: "John Kalu",
                ),
                RefactoredTextField(
                  name: "Relation",
                  hinttext: "Brother",
                ),
                RefactoredTextField(
                  name: "DOB",
                  hinttext: "10-06-1994",
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Security", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                RefactoredTextField(
                  name: "Password",
                  hinttext: "*********",
                ),
                RefactoredTextField(
                  name: "Referral number",
                  hinttext: "*********",
                ),
              ]),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                      "Submit".toUpperCase(),
                      style: TextStyle(
                          color: ColorConstant.mykuriWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
