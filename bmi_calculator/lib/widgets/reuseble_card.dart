import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    required this.color,
    this.cardChild,
    this.onpress,
  }) : super(key: key);

  final Color color;
  final Widget? cardChild;
  final Function? onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpress!();
      },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: cardChild,
      ),
    );
  }
}
