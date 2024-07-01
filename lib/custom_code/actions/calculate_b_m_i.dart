// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> calculateBMI(
  double? height,
  double? weight,
  bool? measureSystem,
) async {
  double bmi = 0;
  int conversionFactor = 1;

  if (measureSystem == false) {
    conversionFactor = 703;
  }

  if (height != null && weight != null) {
    double powHeight = (height * height).toDouble();
    bmi = weight / powHeight;
  }
  bmi = double.parse(bmi.toStringAsFixed(2));
  return bmi * conversionFactor;
}
