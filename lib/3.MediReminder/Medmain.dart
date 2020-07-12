// // ignore: unused_import
// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:final_proj/3.MediReminder/onboarding/OnboardingMain.dart';
// // ignore: unused_import
// import 'package:final_proj/3.MediReminder/onboarding/screens/landing_page.dart';
// import 'package:flutter/material.dart';
// // ignore: duplicate_import
// import 'package:flutter/services.dart';
// import 'package:final_proj/3.MediReminder/global_bloc.dart';
// // ignore: unused_import
// import 'package:final_proj/3.MediReminder/ui/homepage/homepage.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   GlobalBloc globalBloc;

//   void initState() {
//     globalBloc = GlobalBloc();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Provider<GlobalBloc>.value(
//       value: globalBloc,
//       child: MaterialApp(
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           brightness: Brightness.light,
//         ),
//         home: OnboardingApp(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }

// // class OnboardingApp extends StatelessWidget{
// //   @override
// //   Widget build(BuildContext context) {
// //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
// //       statusBarColor: Colors.transparent,
// //       statusBarIconBrightness: Brightness.dark,
// //       statusBarBrightness:
// //       Platform.isAndroid ? Brightness.dark : Brightness.light,
// //       systemNavigationBarColor: Colors.white,
// //       systemNavigationBarDividerColor: Colors.grey,
// //       systemNavigationBarIconBrightness: Brightness.dark,  
// //     ));
// //     return MaterialApp(
// //       title: '',
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         platform: TargetPlatform.iOS, 
// //       ),
// //       home: LandingPage(),
// //     );
// //   }

// // }
