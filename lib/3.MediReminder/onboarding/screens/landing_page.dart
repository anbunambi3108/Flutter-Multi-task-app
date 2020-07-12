import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:final_proj/3.MediReminder/onboarding/constants/constants.dart';
import 'package:final_proj/3.MediReminder/onboarding/ui_view/slider_layout_view.dart';
// ignore: unused_import
import 'package:final_proj/3.MediReminder/onboarding/widgets/custom_font.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: onBordingBody(),
    );
  }

  Widget onBordingBody() => Container(
        child: SliderLayoutView(),
      );
}
