import 'package:flutter/material.dart';

const activeCardColor = Color(0xFF1D1E33);
class ReusableCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final void Function()? onPress;
  ReusableCard({this.color, this.child, this.onPress});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color ?? activeCardColor,
            borderRadius: BorderRadius.circular(10)),
        child: child,
      ),
    );
  }
}