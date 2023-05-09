import 'package:calculatorapp/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: operatorColor,
        // appBar: AppBar(
        //   title: const Text('Calculator'),
        // ),
        body: Column(
          children: [
            //input outpit

            Expanded(
              child: Container(
                // color: Colors.red,
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Input',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Output',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),

            Row(
              children: [
                button(
                  text: 'C',
                  buttonbgColor: operatorColor,
                  tColor: orangeColor,
                ),
                button(
                  text: '<',
                  buttonbgColor: operatorColor,
                  tColor: orangeColor,
                ),
                button(
                  text: '',
                  buttonbgColor: Colors.transparent,
                ),
                button(
                  text: '/',
                  buttonbgColor: operatorColor,
                  tColor: orangeColor,
                ),
              ],
            ),
            Row(
              children: [
                button(
                  text: '7',
                ),
                button(
                  text: '8',
                ),
                button(
                  text: '9',
                ),
                button(
                  text: 'x',
                  buttonbgColor: operatorColor,
                  tColor: orangeColor,
                ),
              ],
            ),
            Row(
              children: [
                button(
                  text: '4',
                ),
                button(
                  text: '5',
                ),
                button(
                  text: '6',
                ),
                button(
                  text: '-',
                  buttonbgColor: operatorColor,
                  tColor: orangeColor,
                ),
              ],
            ),
            Row(
              children: [
                button(
                  text: '1',
                ),
                button(
                  text: '2',
                ),
                button(
                  text: '3',
                ),
                button(
                  text: '+',
                  buttonbgColor: operatorColor,
                  tColor: orangeColor,
                ),
              ],
            ),
            Row(
              children: [
                button(
                  text: '%',
                  buttonbgColor: operatorColor,
                  tColor: orangeColor,
                ),
                button(
                  text: '0',
                ),
                button(
                  text: '.',
                ),
                button(
                  text: '=',
                  buttonbgColor: operatorColor,
                  tColor: orangeColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget button({
  text,
  tColor = Colors.white,
  buttonbgColor = buttonColor,
}) {
  return Container(
    margin: EdgeInsets.all(8.0),
    child: Expanded(
      child: ElevatedButton(
        onPressed: () {
          onButtonClick(text);
        },
        style: ElevatedButton.styleFrom(
          primary: buttonbgColor,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30.0,
            color: tColor,
          ),
        ),
      ),
    ),
  );
}

onButtonClick(value) {
  // print(value);

  var input = '';
  var output = '';
  var operation = '';

  if (value == 'AC') {
    input = '';
    output = '';
  } else if (value == '<') {
    input = input.substring(0, input.length - 1);
  } else if (value == '=') {
    var userInput = input;
    userInput = input.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel cm = ContextModel();
    var finalValue = expression.evaluate(EvaluationType.REAL, cm);
    output = finalValue.toString();
  } else {
    input = input + value;
  }
  setState() {}
}
