import 'package:flutter/material.dart';

class ReuseableTitileWithDes extends StatelessWidget {
  final String titile;
  final String des;
  const ReuseableTitileWithDes(
      {super.key, required this.titile, required this.des});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titile, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          height: 10,
        ),
        Text(
          des,
          textAlign: TextAlign.justify,
          style: TextStyle(height: 1.5),
        ),
      ],
    );
  }
}
