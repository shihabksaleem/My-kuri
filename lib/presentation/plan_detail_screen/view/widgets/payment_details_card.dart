import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';

class PaymentDetailsCard extends StatelessWidget {
  const PaymentDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Color(0xff16BE81),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "21-12-2023",
              style: TextStyle(color: ColorConstant.mykuriWhite),
            ),
            Row(
              children: [
                Text(
                  "21-12-2023",
                  style: TextStyle(color: ColorConstant.mykuriWhite),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
