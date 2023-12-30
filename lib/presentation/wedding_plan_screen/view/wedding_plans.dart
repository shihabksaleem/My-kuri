import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';
import 'package:mykuri/global_widgets/reuseable_title_with_des.dart';
import 'package:mykuri/presentation/payment_summary_screen/view/PaymentSummaryScreen.dart';
import 'package:mykuri/presentation/plan_detail_screen/view/widgets/due_card.dart';
import 'package:mykuri/presentation/wedding_plan_screen/view/widget/due_payment_card.dart';
import 'package:mykuri/presentation/wedding_plan_screen/view/widget/last_payment.dart';

class WeddingPlanScreen extends StatelessWidget {
  const WeddingPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Wedding Plan",
                  style: TextStyle(
                      fontSize: 30,
                      color: ColorConstant.mykuriTextColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              LastPaymentCard(),
              SizedBox(height: 15),
              Text(
                "Due amount",
                style: TextStyle(
                    color: ColorConstant.mykuriTextColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorConstant.liteGreenColor,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: DuePaymentCardRefactor(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ReuseableTitileWithDes(
                  titile: "Payment description",
                  des:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. t velit esse cillum dolore eu fugiat nulla pariatur. '),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentSummaryScreen(),
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
                "View Summary".toUpperCase(),
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
