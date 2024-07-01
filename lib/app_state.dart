import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _activeMetric = true;
  bool get activeMetric => _activeMetric;
  set activeMetric(bool value) {
    _activeMetric = value;
  }

  bool _txtWeightFilled = false;
  bool get txtWeightFilled => _txtWeightFilled;
  set txtWeightFilled(bool value) {
    _txtWeightFilled = value;
  }

  bool _txtHeightField = false;
  bool get txtHeightField => _txtHeightField;
  set txtHeightField(bool value) {
    _txtHeightField = value;
  }

  double _finalWeight = 0.0;
  double get finalWeight => _finalWeight;
  set finalWeight(double value) {
    _finalWeight = value;
  }

  double _finaHeight = 0.0;
  double get finaHeight => _finaHeight;
  set finaHeight(double value) {
    _finaHeight = value;
  }

  String _finalBMI = '';
  String get finalBMI => _finalBMI;
  set finalBMI(String value) {
    _finalBMI = value;
  }

  bool _popupStatus = false;
  bool get popupStatus => _popupStatus;
  set popupStatus(bool value) {
    _popupStatus = value;
  }

  bool _isHealthy = false;
  bool get isHealthy => _isHealthy;
  set isHealthy(bool value) {
    _isHealthy = value;
  }
}
