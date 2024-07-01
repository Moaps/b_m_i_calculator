import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtWeight widget.
  FocusNode? txtWeightFocusNode;
  TextEditingController? txtWeightTextController;
  String? Function(BuildContext, String?)? txtWeightTextControllerValidator;
  // State field(s) for txtField widget.
  FocusNode? txtFieldFocusNode;
  TextEditingController? txtFieldTextController;
  String? Function(BuildContext, String?)? txtFieldTextControllerValidator;
  // Stores action output result for [Custom Action - calculateBMI] action in btnCalculate widget.
  double? resultBMI;
  // Stores action output result for [Custom Action - textBMI] action in btnCalculate widget.
  String? textBMI;
  // Stores action output result for [Custom Action - healthyCheck] action in btnCalculate widget.
  String? healthyStatus;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtWeightFocusNode?.dispose();
    txtWeightTextController?.dispose();

    txtFieldFocusNode?.dispose();
    txtFieldTextController?.dispose();
  }
}
