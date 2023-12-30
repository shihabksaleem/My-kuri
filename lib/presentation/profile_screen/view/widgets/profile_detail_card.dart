import 'package:flutter/material.dart';

class ProfileDetailCard extends StatelessWidget {
  const ProfileDetailCard(
      {super.key, required this.titile, required this.value});

  final String titile;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titile,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
