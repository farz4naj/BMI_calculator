import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled3/reusable_card.dart';
import 'icon_content.dart';

const double buttomContainerHeight = 80;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const buttomContainerColor = Color(0xFFEB1555);

enum Gender{male, female}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {

  Gender? selectedGender;






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
                    color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
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
                    color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(),
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
            color: buttomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: buttomContainerHeight,
          )
        ],
      ),
    );
  }
}



