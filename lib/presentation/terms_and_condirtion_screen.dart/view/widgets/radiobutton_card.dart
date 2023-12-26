import 'package:flutter/material.dart';

class radioButtonContainer extends StatefulWidget {
  final String title;
  const radioButtonContainer({super.key, required this.title});

  @override
  State<radioButtonContainer> createState() => _radioButtonContainerState();
}

class _radioButtonContainerState extends State<radioButtonContainer> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Radio(
            value: 1,
            groupValue: val,
            onChanged: (value) {
              setState(() {});
            },
            activeColor: Colors.green,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(widget.title)
      ],
    );
  }
}
