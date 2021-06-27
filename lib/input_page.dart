import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'light_box.dart';
import 'constants.dart';
import 'results_page.dart';
import 'pink_bar.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  Male,
  Female,
}

class _InputPageState extends State<InputPage> {
  Color currColor1 = darkBlueColor;
  Color currColor2 = darkBlueColor;
  Gender selectedGender;
  int height = 183;
  int weight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    child: LightBox(
                      rang: (selectedGender == Gender.Male)
                          ? lightBlueColor
                          : darkBlueColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 100.0,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'MALE',
                            style: basicTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    child: LightBox(
                      rang: (selectedGender == Gender.Female)
                          ? lightBlueColor
                          : darkBlueColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 100.0,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'FEMALE',
                            style: basicTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: LightBox(
              rang: lightBlueColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: basicTextStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: basicTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      trackHeight: 0.5,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.round();
                        });
                      },
                      min: 120,
                      max: 220,
                      inactiveColor: Color(0xFF8D8E98),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: LightBox(
                    rang: lightBlueColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: basicTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ValueButton(
                              sign: FontAwesomeIcons.minus,
                            ),
                            ValueButton(
                              sign: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: LightBox(
                    rang: lightBlueColor,
                  ),
                )
              ],
            ),
          ),
          pinkBar(
            title: 'CALCULATE',
            tapFunc: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage()));
            },
          ),
        ],
      ),
    );
  }
}

class ValueButton extends StatelessWidget {
  ValueButton({this.sign});
  final IconData sign;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Icon(sign),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      elevation: 6,
      disabledElevation: 6,
    );
  }
}
