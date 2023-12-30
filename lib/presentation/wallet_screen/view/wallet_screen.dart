import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'wallet',
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/Group 572.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 14,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wedding Plan",
                              style:
                                  TextStyle(color: ColorConstant.mykuriWhite),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  color: ColorConstant.mykuriWhite,
                                ),
                                Text(
                                  "4,000",
                                  style: TextStyle(
                                      color: ColorConstant.mykuriWhite,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('History',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorConstant.mykuriTextColor,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('All Plans'),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(Icons.keyboard_arrow_down_rounded)
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: ColorConstant.mykuriLiteGrey)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) => Container(
                          color: index % 2 == 0
                              ? ColorConstant.mykuriWhite
                              : ColorConstant.g1,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Wedding plan"),
                              Text("21-09-2023"),
                              Text("1000 Rs"),
                              Icon(Icons.keyboard_arrow_right_outlined)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
