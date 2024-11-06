import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled3/reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';


enum Gender{male, female}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
int height = 150;



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
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}



