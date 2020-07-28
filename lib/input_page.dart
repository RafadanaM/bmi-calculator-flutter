import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'gender.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'bottom_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 40;
  int age = 40;
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: setCardColour(Gender.male),
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: setCardColour(Gender.female),
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kSecondaryColour,
                      activeTrackColor: kActiveTrackColour,
                      inactiveTrackColor: kInactiveTrackColour,
                      overlayColor: kOverlayColour,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
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
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight > 1 ? weight-- : weight = 1;
                                });
                              },
                              onLongPress: () {
                                timer = Timer.periodic(
                                    Duration(milliseconds: 150), (timer) {
                                  setState(() {
                                    weight > 1 ? weight-- : weight = 1;
                                  });
                                });
                              },
                              onLongPressUp: () {
                                timer.cancel();
                              },
                              child: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight < 200 ? weight++ : weight = 200;
                                });
                              },
                              onLongPress: () {
                                timer = Timer.periodic(
                                    Duration(milliseconds: 150), (timer) {
                                  setState(() {
                                    weight < 200 ? weight++ : weight = 200;
                                  });
                                });
                              },
                              onLongPressUp: () {
                                timer.cancel();
                              },
                              child: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              child: FontAwesomeIcons.minus,
                              onLongPress: () {
                                timer = Timer.periodic(
                                    Duration(milliseconds: 150), (timer) {
                                  setState(() {
                                    age > 1 ? age-- : age = 1;
                                  });
                                });
                              },
                              onLongPressUp: () {
                                timer.cancel();
                              },
                              onPressed: () {
                                setState(() {
                                  age > 1 ? age-- : age = 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              child: FontAwesomeIcons.plus,
                              onLongPress: () {
                                timer = Timer.periodic(
                                    Duration(milliseconds: 150), (timer) {
                                  setState(() {
                                    age < 120 ? age++ : age = 120;
                                  });
                                });
                              },
                              onLongPressUp: () {
                                timer.cancel();
                              },
                              onPressed: () {
                                setState(() {
                                  age < 120 ? age++ : age = 120;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              Navigator.pushNamed(context, '/result');
            },
          )
        ],
      ),
    );
  }

  Color setCardColour(Gender gender) =>
      selectedGender == gender ? kActiveCardColour : kInactiveCardColour;
}
