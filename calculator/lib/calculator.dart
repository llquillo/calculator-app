import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './helper/operations.dart';

class Calculator extends StatefulWidget {
  final operand;
  final x;
  final y;
  final answer;
  final operations;
  Calculator({
    this.operand,
    this.x,
    this.y,
    this.answer,
    this.operations,
  });
  @override
  _CalculatorState createState() => _CalculatorState(
        operand: this.operand,
        x: this.x,
        y: this.y,
        operations: this.operations,
        answer: this.answer,
      );
}

class _CalculatorState extends State<Calculator> {
  List numberButtons = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, '.'];
  List operationButtons = ['+', '-', '*', "/"];
  List functionButtons = ['ce', '='];

  var operand = '';
  var x = '';
  var y = '';

  bool operations = false;

  double answer;

  _CalculatorState({
    @required this.operand,
    @required this.x,
    @required this.y,
    this.operations,
    this.answer,
  });

  TextEditingController inputController = new TextEditingController();

  String addNumber(String number) {
    String currentString = inputController.text;
    return currentString + number;
  }

  void _setString(currentText) {
    setState(() {
      inputController = TextEditingController(text: currentText);
    });
  }

  bool checkPeriod() {
    String current = inputController.text;
    bool state;
    current.contains('.') ? state = false : state = true;
    return state;
  }

  void delete() {
    if (operations && answer != null) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => Calculator(
            operand: null,
            x: null,
            y: null,
            operations: false,
            answer: null,
          ),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    }
    setState(() {
      inputController = TextEditingController(text: null);
    });
  }

  void deleteCurrent() {
    setState(() {
      inputController = TextEditingController(text: null);
    });
  }

  void _setX(var x) {
    setState(() {
      this.x = x;
    });
  }

  void _setY(var y) {
    setState(() {
      this.y = y;
    });
  }

  void _setOperand(var operand) {
    setState(() {
      this.operand = operand;
      this.operations = true;
    });
  }

  void _setAnswer() {
    setState(() {
      inputController = TextEditingController(text: this.answer.toString());
    });
  }

  void _setAnswerNull() {
    setState(() {
      inputController = TextEditingController(text: null);
      this.answer = null;
    });
  }

  void runOperations() {
    if (this.operations) {
      _setY(inputController.text);
      deleteCurrent();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              Operations(operand: this.operand, x: this.x, y: this.y),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (operations && answer != null) {
      _setAnswer();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator",
            style: GoogleFonts.robotoMono(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            this.y == null
                ? (this.x == null
                    ? SizedBox(height: MediaQuery.of(context).size.height / 12)
                    : Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 12,
                        child: Text(
                          '${this.x}\n${this.operand}',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.robotoMono(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ))
                : Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Text(
                      '${this.operand}\n${this.y}',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.robotoMono(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextFormField(
                enabled: false,
                controller: inputController,
                textAlign: TextAlign.right,
                style: GoogleFonts.fredokaOne(color: Colors.black),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 16),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  height: MediaQuery.of(context).size.height / 2.2,
                  child: GridView.count(
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 2,
                    crossAxisCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ...numberButtons.map(
                        (i) => GestureDetector(
                          onTap: () {
                            String numString = i.toString();
                            String currentText = addNumber(numString);
                            if (i == '.') {
                              if (checkPeriod()) {
                                _setString(currentText);
                              }
                            } else {
                              _setString(currentText);
                            }
                          },
                          child: Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 12,
                                decoration: BoxDecoration(
                                  color: Colors.pink[200],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '$i',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.fredokaOne(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3.2,
                  height: MediaQuery.of(context).size.height / 2.2,
                  child: GridView.count(
                    childAspectRatio: 1.8,
                    crossAxisCount: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ...operationButtons.map(
                        (i) => GestureDetector(
                          onTap: () {
                            if (!operations) {
                              _setX(inputController.text);
                              _setOperand(i);
                              delete();
                            } else if (operations && answer != null) {
                              _setX(answer.toString());
                              _setY(null);
                              _setOperand(i);
                              _setAnswerNull();
                            }
                          },
                          child: Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 12,
                                decoration: BoxDecoration(
                                  color: Colors.purple[200],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '$i',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.fredokaOne(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              child: GridView.count(
                childAspectRatio: 2.5,
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ...functionButtons.map(
                    (i) => GestureDetector(
                      onTap: () {
                        switch (i) {
                          case 'ce':
                            delete();
                            break;
                          case '=':
                            runOperations();
                            break;
                        }
                      },
                      child: Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 12,
                            decoration: BoxDecoration(
                              color: Colors.purple[200],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '$i',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.fredokaOne(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
