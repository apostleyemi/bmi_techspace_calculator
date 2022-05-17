import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReUsableCard extends StatelessWidget {
  // Widget? cardChild;
  ReUsableCard({required this.colorName, this.cardChild});
  final Color colorName;
  final Widget? cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colorName,
      ),
    );
  }
}
