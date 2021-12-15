import 'package:flutter/material.dart';

import '../helper/constent.dart';

class IcontContent extends StatelessWidget {
  const IcontContent({
    Key? key,
    required this.icon,
    this.label,
  }) : super(key: key);

  final IconData icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(height: 15.0),
        Text(
          label.toString(),
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
