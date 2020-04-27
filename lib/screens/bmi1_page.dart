import 'package:flutter/material.dart';
import 'package:fluttersampleui/screens/bmi2_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

import 'package:fluttersampleui/components/acwCardDark.dart';
import 'package:fluttersampleui/components/acwIconContent.dart';
import 'package:fluttersampleui/components/acwRoundedIconButton.dart';
import 'package:fluttersampleui/components/acwButtonBottom.dart';

import 'package:fluttersampleui/styles/main_style.dart';

//this sample is enhance base from udemy class. it enhance to fit the function i create for this solution.
enum Gender {
  male,
  female,
}

class Bmi1Page extends StatefulWidget {
  static const String id = 'Bmi1Page';

  @override
  _Bmi1PageState createState() => _Bmi1PageState();
}

class _Bmi1PageState extends State<Bmi1Page> {
  Gender selectedGender;
  int iHeight = 180;
  int iWeight = 60;
  int iAge = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: AcwCardDark(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? myAcwCardDarkActive
                      : myAcwCardDarkInactive,
                  cardChild: AcwIconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                    iconSize: 80.0,
                    iconHeight: 15.0,
                  ),
                ),
              ),
              Expanded(
                child: AcwCardDark(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? myAcwCardDarkActive
                      : myAcwCardDarkInactive,
                  cardChild: AcwIconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                    iconSize: 80.0,
                    iconHeight: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: AcwCardDark(
            color: myAcwCardDarkActive,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: myAcwCardDarkLabel,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      iHeight.toString(),
                      style: myAcwCardDarkTextNumber,
                    ),
                    Text(
                      ' cm',
                      style: myAcwCardDarkLabel,
                    ),
                  ],
                ),
                SliderTheme(
                  child: Slider(
                    value: iHeight.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        iHeight = newValue.round();
                      });
                    },
                  ),
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: AcwCardDark(
                  color: myAcwCardDarkActive,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: myAcwCardDarkLabel,
                      ),
                      Text(
                        iWeight.toString(),
                        style: myAcwCardDarkTextNumber,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AcwRoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                iWeight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          AcwRoundedIconButton(
                            onPressed: () {
                              setState(() {
                                iWeight++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: AcwCardDark(
                  color: myAcwCardDarkActive,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: myAcwCardDarkLabel,
                      ),
                      Text(
                        iAge.toString(),
                        style: myAcwCardDarkTextNumber,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AcwRoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                iAge--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          AcwRoundedIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                iAge++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        AcwButtonBottom(
          buttonText: 'CALCULATE',
          onTap: () {
            CalcBMI calc = CalcBMI(height: iHeight, weight: iWeight);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Bmi2Page(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class CalcBMI {
  CalcBMI({this.height, this.weight});

  final int height;
  final int weight;

  double bmiResult;

  String calculateBMI() {
    bmiResult = weight / pow(height / 100, 2);
    return bmiResult.toStringAsFixed(1);
  }

  String getResult() {
    if (bmiResult >= 25) {
      return 'Overweight';
    } else if (bmiResult > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (bmiResult >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmiResult > 18.5) {
      return 'You have normal body weight. Good job!.';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
