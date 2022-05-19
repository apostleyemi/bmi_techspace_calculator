import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'icon_content.dart';
import 'constants.dart';

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
  int height = 180;
  String rating = '180';
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUsableCard(
                    colorName: SelectedGender == GenderEnum.male
                        ? kActiveCardColor
                        : KInactiveCardColor,
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
                        ? kActiveCardColor
                        : KInactiveCardColor,
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
              colorName: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: KNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29EB1555)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220,
                        // divisions: 4,
                        label: rating,
                        // activeColor: Color(0xFFEB1555),
                        // inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                            rating = newValue.toString();
                            //height=newValue.toInt();
                          });
                          print(newValue);
                        }),
                  ),
                ],
              ),
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
                    colorName: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: KButtomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomConstainerHeight,
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
