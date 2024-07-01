// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> textBMI(
  double bmi,
  bool measureSystem,
) async {
  switch (measureSystem) {
    case true:
      if (bmi < 18.5) {
        return ' underweight';
      } else if (bmi >= 18.5 && bmi < 25) {
        return ' at a healthy weight';
      } else if (bmi >= 25 && bmi < 30) {
        return ' overweight (pre-obesity)';
      } else if (bmi >= 30 && bmi < 35) {
        return ' moderately obese (class I)';
      } else if (bmi >= 35 && bmi < 40) {
        return ' severely obese (class II)';
      } else {
        return ' very severely obese (class III)';
      }
    case false:
      if (bmi < 16) {
        return ' severely underweight';
      } else if (bmi >= 16 && bmi < 17) {
        return ' underweight';
      } else if (bmi >= 17 && bmi < 18.5) {
        return ' mildly underweight';
      } else if (bmi >= 18.5 && bmi < 25) {
        return ' at a healthy weight';
      } else if (bmi >= 25 && bmi < 30) {
        return ' overweight';
      } else if (bmi >= 30 && bmi < 35) {
        return ' moderately obese (class I)';
      } else if (bmi >= 35 && bmi < 40) {
        return ' severely obese (class II)';
      } else {
        return ' very severely obese (class III)';
      }
    default:
      return 'Invalid measure system';
  }
}
