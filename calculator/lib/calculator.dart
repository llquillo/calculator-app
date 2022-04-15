import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List numberButtons = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, '.'];
  List operationButtons = ['+', '-', '*', "/"];
  List functionButtons = ['ce', '='];

  TextEditingController inputController = new TextEditingController();

  String addNumber(String number) {
    String currentString = inputController.text;
    return currentString + number;
  }

  void delete() {
    setState(() {
      inputController = TextEditingController(text: null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator",
            style: GoogleFonts.robotoMono(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 16),
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
                            setState(() {
                              inputController =
                                  TextEditingController(text: currentText);
                            });
                            print(i);
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
                            switch (i) {
                              case '+': //add
                              case '-': //subtract
                              case '*': //multiply
                              case '/': //divide
                            }
                            print(i);
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
                          case '=': //call operation class
                        }
                        print(i);
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
