import 'package:flutter/material.dart';
import 'package:untitled3/bottom_button.dart';
import 'package:untitled3/constants.dart';
import 'package:untitled3/reusable_card.dart';

class ResultsPage extends StatelessWidget{
  final String bmiResult, resultText, interpretation;
  const ResultsPage({required this.bmiResult, required this.interpretation, required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result Page'),),
      body: Column(
        children: [
          Expanded(child: Container(padding: const EdgeInsets.all(15), child:Text('Your Result', style: kNumberTextStyle.copyWith(fontSize: 50)), alignment: Alignment.bottomLeft,)),
          Expanded(flex: 5,child: ReusableCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$resultText', style: kResultTextStyle,),
                Text('$bmiResult', style: kBMITextStyle,),
                Column(
                  children: [
                    Text('Normal BMI range',style: kGreyTextStyle,),
                    Text('18.5 - 25kg/m2', style: kBodyTextStyle,),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text('$interpretation', style: kBodyTextStyle,textAlign: TextAlign.center,)),
              ],
            ),
          )),
          BottomButton(title: 'RE-CALCULATE', onTap: (){
            Navigator.pop(context);
          })
        ],
      )
    );
  }
}
