import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled3/Calculator.dart';
import 'package:untitled3/result_page.dart';
import 'package:untitled3/reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bottom_button.dart';


enum Gender{male, female}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
int height = 150;
int weight = 70;
int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: iconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                    color: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: iconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                    color: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$height', style: kNumberTextStyle),
                      Text('cm', style: kLabelTextStyle)
                    ],
                  ),
                  Slider(
                    min: 120,
                      max: 220,
                      value: height.toDouble(),
                      onChanged: (value){
                      setState(() {
                        height = value.round();
                        print('$value');
                      });},
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text('$weight', style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPress: () {
                              setState(() {
                                weight--;
                              });
                              },
                            ),
                            SizedBox(width: 15,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPress: (){
                              setState(() {
                                weight++;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelTextStyle),
                        Text('$age', style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 15,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(title: 'CALCULATE', onTap: (){
            Calculator calculator= Calculator(weight: weight, height: height);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResult: calculator.calculateBMI(),
              resultText: calculator.getResult(),
              interpretation: calculator.getInterpretation(),
            )));
          })
        ],
      ),
    );

  }
}



class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPress;
  RoundIconButton({this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 0,
    );
  }
}



