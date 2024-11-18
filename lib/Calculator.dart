import 'dart:math';

class Calculator {
  int? height, weight;
  double _bmi = 0;
  Calculator({required this.weight, required this.height});
  
  String calculateBMI() {
    _bmi = weight!/pow(height!/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return'you have a higher than a normal body weight. try to exercise more.';
    }else if(_bmi >= 10.5) {
      return'you have a normal body weight. good job!';
    }else {
      return'you have a lower than a normal body weight. ypu can eat a bit more.';
    }
  }
  String getResult(){
    if(_bmi >= 25){
      return 'overweight';
    }else if (_bmi >= 18.5){
      return 'normal';
    }else{
      return 'underweight';
    }
  }

}