import 'package:flutter/material.dart';
import 'card_content.dart';
import 'constants.dart';

class ReUsableIconContent extends StatelessWidget {
  ReUsableIconContent({this.embededIcon, this.gender, this.onPress});
  final IconData? embededIcon;
  final String? gender;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            embededIcon,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            gender!,
            style: kLabelTextStyle,
          )
        ],
      ),
    );
  }
}
