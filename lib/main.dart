import 'package:calculator_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  String inputUser = '';
  String result = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundGreenColor,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 31),
                child: Center(
                  child: Container(
                    width: 365,
                    height: 188,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(4, 4),
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(-4, -4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 12, left: 163, top: 70, bottom: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            inputUser,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            result,
                            style: TextStyle(
                              fontSize: 44,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Column(
                children: [
                  _getRow('ac', 'ce', '%', '/'),
                  SizedBox(height: 23),
                  _getRow('7', '8', '9', '*'),
                  SizedBox(height: 23),
                  _getRow('4', '5', '6', '-'),
                  SizedBox(height: 23),
                  _getRow('1', '2', '3', '+'),
                  SizedBox(height: 23),
                  _getRow('00', '0', '.', '='),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRow(
      String button1, String button2, String button3, String button4) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: (() {
              if (button1 == 'ac') {
                setState(() {
                  inputUser = '';
                });
              } else {
                buttonPressed(button1);
              }
            }),
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: isOperator(button1)
                    ? operatorButtonsGreenColor
                    : Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(4, 4),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(-4, -4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  button1,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (button2 == 'ce') {
                setState(() {
                  if (inputUser.length > 0) {
                    inputUser = inputUser.substring(0, inputUser.length - 1);
                  }
                });
              } else {
                buttonPressed(button2);
              }
            },
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: isOperator(button2)
                    ? operatorButtonsGreenColor
                    : Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(4, 4),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(-4, -4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  button2,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              buttonPressed(button3);
            },
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: isOperator(button3)
                    ? operatorButtonsGreenColor
                    : Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(4, 4),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(-4, -4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  button3,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (button4 == '=') {
                Parser parser = Parser();
                Expression expression = parser.parse(inputUser);
                ContextModel contextModel = ContextModel();
                double eval =
                    expression.evaluate(EvaluationType.REAL, contextModel);
                setState(() {
                  result = eval.toString();
                });
              } else {
                buttonPressed(button4);
              }
            },
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: isOperator(button4)
                    ? operatorButtonsGreenColor
                    : Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(4, 4),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(-4, -4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  button4,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void buttonPressed(String button) {
    setState(() {
      inputUser += button;
    });
  }

  bool isOperator(String button) {
    var list = ['ac', 'ce', '%', '/', '*', '-', '+', '='];

    for (var item in list) {
      if (button == item) {
        return true;
      }
    }

    return false;
  }
}
