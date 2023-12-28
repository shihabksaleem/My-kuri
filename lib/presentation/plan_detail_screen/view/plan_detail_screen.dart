import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/presentation/plan_detail_screen/view/widgets/due_card.dart';
import 'package:mykuri/presentation/plan_detail_screen/view/widgets/my_kuri_payment_card.dart';
import 'package:mykuri/presentation/plan_detail_screen/view/widgets/payment_details_card.dart';
import 'package:mykuri/global_widgets/reuseable_title_with_des.dart';

class PlanDetailScreen extends StatelessWidget {
  const PlanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 3,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/plan a.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorConstant.mykuriWhite,
                        child: Icon(
                          Icons.map,
                          color: Color(0xff16BE81),
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Wedding Plan",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: ColorConstant.mykuriWhite),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 5,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Started : 21-12-2023",
                            style: TextStyle(color: ColorConstant.mykuriWhite),
                          ),
                          Text(
                            "Expire : 21-12-2023",
                            style: TextStyle(color: ColorConstant.mykuriWhite),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: ColorConstant.mykuriWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment details",
                  style: TextStyle(
                      color: ColorConstant.mykuriTextColor,
                      fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: PaymentDetailsCard(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Total amount paid",
                      style: TextStyle(
                          color: ColorConstant.mykuriTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      height: 40,
                      child: Center(
                          child: Text("4000 Rs",
                              style: TextStyle(
                                  color: ColorConstant.mykuriWhite,
                                  fontWeight: FontWeight.bold))),
                      color: ColorConstant.mykuriPrimaryBlue,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Balance amount",
                      style: TextStyle(
                          color: ColorConstant.mykuriTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      height: 40,
                      child: Center(
                          child: Text("4000 Rs",
                              style: TextStyle(
                                  color: ColorConstant.mykuriTextColor,
                                  fontWeight: FontWeight.bold))),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ReuseableTitileWithDes(
                    titile: "Plan Description ",
                    des:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. t velit esse cillum dolore eu fugiat nulla pariatur."),
                SizedBox(height: 20),
                Text(
                  "Payment details",
                  style: TextStyle(
                      color: ColorConstant.mykuriTextColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF2EFEF),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => DuePaymentCard(),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "My Kuri payments",
                  style: TextStyle(
                      color: ColorConstant.mykuriTextColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) => MyKuriPaymentCard(),
                ),
                SizedBox(height: 20),
                ReuseableTitileWithDes(
                    titile: "Terms and conditions",
                    des:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. t velit esse cillum dolore eu fugiat nulla pariatur. Ut enim ad minim veniam, quis nostrud."),
                SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
