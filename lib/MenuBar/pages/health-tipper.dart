import 'package:final_proj/MenuBar/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:final_proj/4.HealthTipper/Tipper_onboarding/first.dart';

void main() {
  runApp(TipperApp());
}

class TipperApp extends StatelessWidget with NavigationStates{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title:'Health app',
    theme:ThemeData(
      primarySwatch:Colors.blue,
    ),
    home: IntroPage(), 
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:final_proj/MenuBar/bloc.navigation_bloc/navigation_bloc.dart';

// class HealthTipper extends StatelessWidget with NavigationStates{
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Text(
//       "Health Tipper App",
//       style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
//     ));
//   }
// }
