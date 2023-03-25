// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  //variables to calculate and display numbers
  int? firstNum;
  int? secondNum;
  String? result;
  String? equation;
  String textToDisplay = "0";
  String? operatorToPerform;

  void buttonClicked(String buttonText) {
    //to clear all text from the text
    if (buttonText == "C") {
      textToDisplay = "0";
      firstNum = 0;
      secondNum = 0;
      result = "0";
    }
    //perform functions for example addition, subtraction, etc.
    else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "÷") {
      firstNum = int.parse(textToDisplay);
      result = '0';
      operatorToPerform = buttonText;
    } else if (buttonText == "=") {
      secondNum = int.parse(textToDisplay);
      if (operatorToPerform == "+") {
        result = (firstNum! + secondNum!).toString();
      }
      if (operatorToPerform == "-") {
        result = (firstNum! - secondNum!).toString();
      }
      if (operatorToPerform == "x") {
        result = (firstNum! * secondNum!).toString();
      }
      if (operatorToPerform == "÷") {
        result = (firstNum! / secondNum!).toString();
      }
      if (operatorToPerform == "%") {

      }
    } else {
      result = int.parse(textToDisplay + buttonText).toString();
    }
    setState(() {
      textToDisplay = result!;
    });
  }


  //button widget of the calculator all buttons
  Widget CalculatorButton(
      {required String buttonValue, required Color buttonColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(buttonColor),
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)))),
            ),
            onPressed: () {
              buttonClicked(buttonValue);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                buttonValue,
                style: GoogleFonts.figtree(fontSize: 25.0, color: Colors.white),
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Hashir\'s Calculator'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleSpacing: 1.0,
        titleTextStyle:
            GoogleFonts.figtree(fontSize: 22.0, fontWeight: FontWeight.bold),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Text(
              textToDisplay,
              style: GoogleFonts.figtree(fontSize: 30.0, color: Colors.white),
            ),
          ),
          //4 buttons in a row
          Row(
            children: [
              CalculatorButton(
                  buttonValue: '7', buttonColor: Colors.grey.shade600),
              CalculatorButton(
                  buttonValue: '8', buttonColor: Colors.grey.shade600),
              CalculatorButton(
                  buttonValue: '9', buttonColor: Colors.grey.shade600),
              CalculatorButton(
                  buttonValue: 'x', buttonColor: Colors.orange),
            ],
          ),
          //4 buttons in a row
          Row(
            children: [
              CalculatorButton(
                  buttonValue: '4', buttonColor: Colors.grey.shade600),
              CalculatorButton(
                  buttonValue: '5', buttonColor: Colors.grey.shade600),
              CalculatorButton(
                  buttonValue: '6', buttonColor: Colors.grey.shade600),
              CalculatorButton(
                  buttonValue: '-', buttonColor: Colors.orange),
            ],
          ),
          //4 buttons in a row
          Row(
            children: [
              CalculatorButton(
                  buttonValue: '1', buttonColor: Colors.grey.shade600),
              CalculatorButton(
                  buttonValue: '2', buttonColor: Colors.grey.shade600),
              CalculatorButton(
                  buttonValue: '3', buttonColor: Colors.grey.shade600),
              CalculatorButton(
                  buttonValue: '÷', buttonColor: Colors.orange),
            ],
          ),
          //4 buttons in a row
          Row(
            children: [
              CalculatorButton(
                  buttonValue: 'C', buttonColor: Colors.orange),
              CalculatorButton(
                  buttonValue: '0', buttonColor: Colors.grey.shade600),
              CalculatorButton(
                  buttonValue: '00', buttonColor: Colors.grey.shade600),
              CalculatorButton(
                  buttonValue: '=', buttonColor: Colors.orange),
            ],
          )
        ],
      ),
    );
  }
}
