import 'package:flutter/material.dart';

const double buttomContainerHeight = 80;
const activeCardColor = Color(0xFF1D1E33);
const buttomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
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

class ReusableCard extends StatelessWidget {
  final Color? color;
  ReusableCard({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: color ?? activeCardColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
