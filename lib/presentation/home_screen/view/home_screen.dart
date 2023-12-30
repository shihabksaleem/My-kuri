import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/core/db/db.dart';
import 'package:mykuri/presentation/home_screen/view/widgets/planA_payment_card_refactor.dart';
import 'package:mykuri/presentation/home_screen/view/widgets/planB_payment_card_refactor.dart';
import 'package:mykuri/presentation/plan_detail_screen/view/plan_detail_screen.dart';
import 'package:mykuri/presentation/wallet_screen/view/wallet_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: [
          CircleAvatar(
            radius: 22,
            backgroundColor: ColorConstant.mykuriPrimaryBlue,
            child: CircleAvatar(
              radius: 20,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Hello Joseph",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text("Please complete your profile "),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.info,
                  color: Colors.amber,
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.sizeOf(context).height / 4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.jpg"),
                      fit: BoxFit.cover)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/images/bis.png"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "20-10-2023",
                          style: TextStyle(
                              color: ColorConstant.mykuriWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    Center(
                      child: Text(
                        "Today’s Gold Rate",
                        style: TextStyle(
                            color: ColorConstant.mykuriWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color(0xffF27712),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "1 Gram 916  ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorConstant.mykuriWhite),
                                    ),
                                    Text(
                                      "5885 Rs",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                          color: ColorConstant.mykuriWhite),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color(0xffF27712),
                                ),
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "1 Gram 916  ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorConstant.mykuriWhite),
                                    ),
                                    Text(
                                      "5885 Rs",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                          color: ColorConstant.mykuriWhite),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => WalletScreen(),
                //   ),
                // );
              },
              child: Hero(
                tag: 'wallet',
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstant.mykuriPrimaryBlue),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/wallet_blue.png",
                        fit: BoxFit.fitHeight,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Wallet",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: ColorConstant.mykuriWhite),
                            ),
                            Text(
                              "\$ 40,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: ColorConstant.mykuriWhite),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "My Kuri plans",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanDetailScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: dbData.myPlanColor[index]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: ColorConstant.mykuriWhite,
                        child: Icon(
                          Icons.map,
                          size: 40,
                          color: dbData.iconsColor[index],
                        ),
                      ),
                      Text(
                        "Wedding Plan",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "My Kuri payments",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: index % 2 == 00
                    ? PaymentCardRefactorPlanA()
                    : PaymentCardRefactorPlanB(),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
