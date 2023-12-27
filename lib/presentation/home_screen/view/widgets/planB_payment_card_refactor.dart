import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';

class PaymentCardRefactorPlanB extends StatelessWidget {
  const PaymentCardRefactorPlanB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Color(0xffF2EFEF), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
              radius: 30,
              backgroundColor: ColorConstant.mykuriWhite,
              child: Image.asset("assets/images/wallet12.png")),
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wedding plan",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text("21-12-2023"),
              ]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "2000 Rs",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              SizedBox(width: 6),
              Icon(
                Icons.arrow_forward_ios_sharp,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
