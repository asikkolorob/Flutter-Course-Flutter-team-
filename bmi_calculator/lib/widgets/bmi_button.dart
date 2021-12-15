import 'package:flutter/material.dart';

import '../helper/constent.dart';

class BmiButton extends StatelessWidget {
  const BmiButton({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text.toUpperCase(),
          style: kBottonButtonText,
        ),
        margin: const EdgeInsets.only(top: 10.0),
        color: kBottomButtonColor,
        height: kBottomButtonHeight,
        width: double.infinity,
      ),
    );
  }
}
