import 'package:flutter/material.dart';

class RefactoredTextField extends StatelessWidget {
  const RefactoredTextField({super.key, required this.name, this.iseye});
  final String name;
  final bool? iseye;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 10),
        TextField(
            obscureText: iseye == true ? true : false,
            decoration: InputDecoration(
                labelText: name,
                hintText: name,
                border: OutlineInputBorder(),
                suffixIcon:
                    iseye == true ? Icon(Icons.remove_red_eye) : SizedBox())),
        SizedBox(height: 20),
      ],
    );
  }
}