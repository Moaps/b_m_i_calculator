import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.txtWeightTextController ??= TextEditingController();
    _model.txtWeightFocusNode ??= FocusNode();
    _model.txtWeightFocusNode!.addListener(
      () async {
        FFAppState().txtWeightFilled = true;
        setState(() {});
      },
    );
    _model.txtFieldTextController ??= TextEditingController();
    _model.txtFieldFocusNode ??= FocusNode();
    _model.txtFieldFocusNode!.addListener(
      () async {
        FFAppState().txtHeightField = true;
        setState(() {});
      },
    );
    animationsMap.addAll({
      'buttonOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'BMI Calculator',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Noto Sans JP',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if ((isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible)
                            ? false
                            : true)
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                Theme.of(context).brightness == Brightness.dark
                                    ? 'assets/images/img_jogging_dark.png'
                                    : 'assets/images/img_jogging_light.png',
                                width: 300.0,
                                height: 309.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if ((isWeb
                                      ? MediaQuery.viewInsetsOf(context)
                                              .bottom >
                                          0
                                      : _isKeyboardVisible)
                                  ? false
                                  : true)
                                FFButtonWidget(
                                  onPressed: () async {
                                    FFAppState().activeMetric = true;
                                    setState(() {});
                                  },
                                  text: 'Metric',
                                  icon: FaIcon(
                                    FontAwesomeIcons.pencilRuler,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 147.0,
                                    height: 45.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FFAppState().activeMetric == true
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'buttonOnActionTriggerAnimation1']!,
                                ),
                              if ((isWeb
                                      ? MediaQuery.viewInsetsOf(context)
                                              .bottom >
                                          0
                                      : _isKeyboardVisible)
                                  ? false
                                  : true)
                                FFButtonWidget(
                                  onPressed: () async {
                                    FFAppState().activeMetric = false;
                                    setState(() {});
                                  },
                                  text: 'Imperial',
                                  icon: FaIcon(
                                    FontAwesomeIcons.crown,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 147.0,
                                    height: 45.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FFAppState().activeMetric == true
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryText
                                        : FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'buttonOnActionTriggerAnimation2']!,
                                ),
                            ].divide(SizedBox(width: 15.0)),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    controller: _model.txtWeightTextController,
                                    focusNode: _model.txtWeightFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.txtWeightTextController',
                                      Duration(milliseconds: 100),
                                      () async {
                                        FFAppState().txtWeightFilled = true;
                                        setState(() {});
                                      },
                                    ),
                                    onFieldSubmitted: (_) async {
                                      FFAppState().txtWeightFilled = true;
                                      setState(() {});
                                    },
                                    autofocus: true,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText:
                                          FFAppState().activeMetric == true
                                              ? 'Your  weight (kg)'
                                              : 'Your  weight (lb)',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    validator: _model
                                        .txtWeightTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('^\\d*.?\\d*\$'))
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    controller: _model.txtFieldTextController,
                                    focusNode: _model.txtFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.txtFieldTextController',
                                      Duration(milliseconds: 100),
                                      () async {
                                        FFAppState().txtHeightField = true;
                                        setState(() {});
                                      },
                                    ),
                                    onFieldSubmitted: (_) async {
                                      FFAppState().txtHeightField = true;
                                      setState(() {});
                                    },
                                    autofocus: true,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText:
                                          FFAppState().activeMetric == true
                                              ? 'Your height (m)'
                                              : 'Your height (in)',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      alignLabelWithHint: false,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      suffixIcon: _model.txtFieldTextController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.txtFieldTextController
                                                    ?.clear();
                                                FFAppState().txtHeightField =
                                                    true;
                                                setState(() {});
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                size: 22,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    validator: _model
                                        .txtFieldTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('^\\d*.?\\d*\$'))
                                    ],
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 20.0)),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: (((FFAppState().txtWeightFilled ==
                                                        true) &&
                                                    (FFAppState()
                                                            .txtHeightField ==
                                                        true)
                                                ? false
                                                : true) ||
                                            ((_model.txtWeightTextController
                                                                .text !=
                                                            null &&
                                                        _model.txtWeightTextController
                                                                .text !=
                                                            '') &&
                                                    (_model.txtFieldTextController
                                                                .text !=
                                                            null &&
                                                        _model.txtFieldTextController
                                                                .text !=
                                                            '')
                                                ? false
                                                : true)
                                        ? true
                                        : false)
                                    ? null
                                    : () async {
                                        _model.resultBMI =
                                            await actions.calculateBMI(
                                          double.tryParse(_model
                                              .txtFieldTextController.text),
                                          double.tryParse(_model
                                              .txtWeightTextController.text),
                                          FFAppState().activeMetric,
                                        );
                                        _model.textBMI = await actions.textBMI(
                                          _model.resultBMI!,
                                          FFAppState().activeMetric,
                                        );
                                        _model.healthyStatus =
                                            await actions.healthyCheck(
                                          _model.resultBMI!,
                                        );
                                        FFAppState().finaHeight = double.parse(
                                            _model.txtFieldTextController.text);
                                        FFAppState().finalWeight = double.parse(
                                            _model
                                                .txtWeightTextController.text);
                                        setState(() {});
                                        setState(() {
                                          _model.txtFieldTextController
                                              ?.clear();
                                        });
                                        FFAppState().popupStatus = true;
                                        FFAppState().isHealthy =
                                            _model.healthyStatus == 'healthy'
                                                ? true
                                                : false;
                                        setState(() {});

                                        setState(() {});
                                      },
                                text: 'Calculate',
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 45.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                  disabledColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  disabledTextColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ),
                            ),
                            if (((FFAppState().txtWeightFilled == true) &&
                                            (FFAppState().txtHeightField ==
                                                true)
                                        ? false
                                        : true) ||
                                    ((_model.txtWeightTextController.text !=
                                                    null &&
                                                _model.txtWeightTextController
                                                        .text !=
                                                    '') &&
                                            (_model.txtFieldTextController
                                                        .text !=
                                                    null &&
                                                _model.txtFieldTextController
                                                        .text !=
                                                    '')
                                        ? false
                                        : true)
                                ? true
                                : false)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50.0, 2.0, 50.0, 0.0),
                                child: Text(
                                  'Please fill all fields before calculating the IMC. Use \".\" instead of comma.',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 48.0,
                                fillColor: FlutterFlowTheme.of(context).accent1,
                                hoverColor:
                                    FlutterFlowTheme.of(context).primary,
                                icon: FaIcon(
                                  FontAwesomeIcons.githubAlt,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  await launchURL('https://github.com/Moaps');
                                },
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 48.0,
                                fillColor: FlutterFlowTheme.of(context).accent1,
                                hoverColor:
                                    FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.outgoing_mail,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  await launchURL(
                                      'mailto:clariana.nscosta@gmail.com');
                                },
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 48.0,
                                fillColor: FlutterFlowTheme.of(context).accent1,
                                hoverColor:
                                    FlutterFlowTheme.of(context).primary,
                                icon: FaIcon(
                                  FontAwesomeIcons.linkedin,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  await launchURL(
                                      'https://www.linkedin.com/in/clariananogueira/');
                                },
                              ),
                            ].divide(SizedBox(width: 15.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
              if (FFAppState().popupStatus == true ? true : false)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 355.0,
                    height: 678.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 10.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (FFAppState().popupStatus == true ? true : false)
                          Align(
                            alignment: AlignmentDirectional(0.89, -0.95),
                            child: FlutterFlowIconButton(
                              borderRadius: 0.0,
                              borderWidth: 0.0,
                              buttonSize: 52.0,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                FFAppState().popupStatus = false;
                                setState(() {});
                              },
                            ),
                          ),
                        if (FFAppState().popupStatus == true ? true : false)
                          Align(
                            alignment: AlignmentDirectional(0.0, -0.7),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              child: Text(
                                'Hi, your BMI is:',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        if (FFAppState().popupStatus == true ? true : false)
                          Align(
                            alignment: AlignmentDirectional(0.0, -0.5),
                            child: Text(
                              valueOrDefault<String>(
                                _model.resultBMI?.toString(),
                                '0',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        Stack(
                          children: [
                            if ((FFAppState().isHealthy == false) &&
                                    (FFAppState().popupStatus == true)
                                ? true
                                : false)
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.08),
                                child: FaIcon(
                                  FontAwesomeIcons.skullCrossbones,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 230.0,
                                ),
                              ),
                            if ((FFAppState().popupStatus == true) &&
                                    (FFAppState().isHealthy == true)
                                ? true
                                : false)
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.08),
                                child: Icon(
                                  Icons.mood_rounded,
                                  color: FlutterFlowTheme.of(context).success,
                                  size: 250.0,
                                ),
                              ),
                          ],
                        ),
                        if (FFAppState().popupStatus == true ? true : false)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.6),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 0.0),
                              child: Text(
                                'According to the resultes, you are ${_model.textBMI}',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                      ].divide(SizedBox(height: 25.0)),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
