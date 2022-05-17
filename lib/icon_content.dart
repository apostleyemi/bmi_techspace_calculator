import 'package:flutter/material.dart';
import 'card_content.dart';

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

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
            style: labelTextStyle,
          )
        ],
      ),
    );
  }
}
