import 'package:calculator/ui/calculator_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: const MyCalculator(),
  ));
}

