import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'icon_content.dart';

const bottomConstainerHeight = 80.0;
const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);
const buttomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum GenderEnum {
  male,
  female,
  empty,
}

class _InputPageState extends State<InputPage> {
  GenderEnum SelectedGender = GenderEnum.empty;
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  //
  // //initialize GenderClass here
  // bool isMaleColor=fla

  /* void updateCardColor(GenderEnum selectedGender) {
    if (selectedGender == GenderEnum.male) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    } else if (selectedGender == GenderEnum.female) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(
                    colorName: SelectedGender == GenderEnum.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: ReUsableIconContent(
                      onPress: () {
                        setState(() {
                          SelectedGender = GenderEnum.male;
                        });
                      },
                      embededIcon: FontAwesomeIcons.mars,
                      gender: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    colorName: SelectedGender == GenderEnum.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: ReUsableIconContent(
                      onPress: () {
                        setState(() {
                          SelectedGender = GenderEnum.female;
                        });
                      },
                      embededIcon: FontAwesomeIcons.venus,
                      gender: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUsableCard(
              colorName: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(colorName: Colors.blue),
                ),
                Expanded(
                  child: ReUsableCard(
                    colorName: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: buttomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomConstainerHeight,
            child: Text(
              "Calculate BMI",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class ReUsableCardChild extends StatelessWidget {
  ReUsableCardChild({this.embededIcon, this.gender});
  final IconData? embededIcon;
  final String? gender;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}

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
