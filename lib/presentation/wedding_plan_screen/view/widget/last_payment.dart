import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';

class LastPaymentCard extends StatelessWidget {
  const LastPaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorConstant.liteGreenColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Last Payment"),
              Text("21-10-2023"),
              Text("1000 RS"),
            ],
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("Terms and conditions")],
        )
      ],
    );
  }
}
