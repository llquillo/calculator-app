import 'package:flutter/material.dart';
import '../calculator.dart';

class Operations extends StatefulWidget {
  final operand;
  final x;
  final y;
  Operations({
    @required this.operand,
    @required this.x,
    @required this.y,
  });
  @override
  _OperationsState createState() => _OperationsState(
        operand: this.operand,
        x: this.x,
        y: this.y,
      );
}

class _OperationsState extends State<Operations> {
  var operand = '';
  var x = '';
  var y = '';

  _OperationsState({
    @required this.operand,
    @required this.x,
    @required this.y,
  });

  double calculate() {
    switch (this.operand) {
      case '+':
        return double.parse(this.x) + double.parse(this.y);
      case '-':
        return double.parse(this.x) - double.parse(this.y);
      case '*':
        return double.parse(this.x) * double.parse(this.y);
      case '/':
        return double.parse(this.x) / double.parse(this.y);
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    double answer = calculate();
    return Calculator(
      operand: this.operand,
      x: '',
      y: this.y,
      operations: true,
      answer: answer,
    );
  }
}
