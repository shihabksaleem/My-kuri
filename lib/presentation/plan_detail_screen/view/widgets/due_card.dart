import 'package:flutter/material.dart';
import 'package:mykuri/core/constant/color_constant.dart';

class DuePaymentCard extends StatelessWidget {
  const DuePaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "21-12-2023",
            style: TextStyle(
                color: ColorConstant.mykuriTextColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "1000 Rs",
            style: TextStyle(
                color: ColorConstant.mykuriTextColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
