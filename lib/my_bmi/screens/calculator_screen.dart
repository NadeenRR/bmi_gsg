import 'package:bmi/my_bmi/components/my_button.dart';
import 'package:bmi/my_bmi/screens/result_page.dart';
import 'package:bmi/my_bmi/utils/bmi.dart';
import 'package:flutter/material.dart';

import '../components/my_card.dart';
import '../components/my_round_icon_button.dart';
import '../constants.dart';

enum Gender {
  male,
  female,
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int weight = 20;
  int age = 10;
  int height = 120;
  Gender? selectGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MyCard(
                  onTap: () {
                    setState(() {
                      selectGender = Gender.male;
                    });
                  },
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.male,
                        size: 70,
                      ),
                      Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  color: selectGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
              ),
              Expanded(
                child: MyCard(
                  onTap: () {
                    setState(() {
                      selectGender = Gender.female;
                    });
                  },
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.female,
                        size: 70,
                      ),
                      Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  color: selectGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: MyCard(
            color: kActiveCardColour,
            childWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text(
                  'HEIGHT',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  ' ${height.round()} cm',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Colors.purple,
                    overlayColor: const Color(0x29EB1555),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 25.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    label: height.round().toString(),
                    // min: 140,
                    max: 200,
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MyCard(
                  color: kActiveCardColour,
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyRoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          MyRoundIconButton(
                            icon: Icons.remove,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MyCard(
                  color: kActiveCardColour,
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        age.toString(),
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyRoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          MyRoundIconButton(
                            icon: Icons.remove,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        MyButton(
            onTap: () {
              BMI calc = BMI(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            buttonTitle: 'Calculator'),
      ]),
    );
  }
}
