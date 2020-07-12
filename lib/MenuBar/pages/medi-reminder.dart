// ignore: unused_import
import 'dart:io';
import 'package:final_proj/MenuBar/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/services.dart';
import 'package:final_proj/3.MediReminder/onboarding/OnboardingMain.dart';
// ignore: unused_import
import 'package:final_proj/3.MediReminder/onboarding/screens/landing_page.dart';
import 'package:flutter/material.dart';
// ignore: duplicate_import
import 'package:flutter/services.dart';
import 'package:final_proj/3.MediReminder/global_bloc.dart';
// ignore: unused_import
import 'package:final_proj/3.MediReminder/ui/homepage/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MedApp());
}

class MedApp extends StatefulWidget with NavigationStates {
  @override
  _MedAppState createState() => _MedAppState();
}

class _MedAppState extends State<MedApp> {
  GlobalBloc globalBloc;

  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
        ),
        home: MedOnboardingApp(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// class OnboardingApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark,
//       statusBarBrightness:
//       Platform.isAndroid ? Brightness.dark : Brightness.light,
//       systemNavigationBarColor: Colors.white,
//       systemNavigationBarDividerColor: Colors.grey,
//       systemNavigationBarIconBrightness: Brightness.dark,  
//     ));
//     return MaterialApp(
//       title: '',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         platform: TargetPlatform.iOS, 
//       ),
//       home: LandingPage(),
//     );
//   }

// }


// import 'package:flutter/material.dart';
// import 'package:final_proj/MenuBar/bloc.navigation_bloc/navigation_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:final_proj/3.MediReminder/global_bloc.dart';
// import 'package:final_proj/3.MediReminder/homepage/medhomepage.dart';

// // class MedicineReminder extends StatelessWidget with NavigationStates{
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //         child: Text(
// //       "Medi-Remider App",
// //       style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
// //     ));
// //   }
// // }

// class MedicineReminder extends StatefulWidget  with NavigationStates{
//   @override
//   _MedicineReminderState createState() => _MedicineReminderState();
// }

// class _MedicineReminderState extends State<MedicineReminder> {
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
//         home: MedHomePage(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:final_proj/MenuBar/bloc.navigation_bloc/navigation_bloc.dart';
// // // ignore: unused_import
// // import 'package:provider/provider.dart';
// // // import 'package:final_proj/3.MediReminder/global_bloc.dart';
// // // import 'package:final_proj/3.MediReminder/homepage/homepage.dart';

// // // void main() {
// // //   runApp(MedicineReminder());
// // // }

// // // class MedicineReminder extends StatefulWidget with NavigationStates{
// // //   @override
// // //   _MedicineReminderState createState() => _MedicineReminderState();
// // // }

// // // class _MedicineReminderState extends State<MedicineReminder> {
// // //   GlobalBloc globalBloc;

// // //   void initState() {
// // //     globalBloc = GlobalBloc();
// // //     super.initState();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Provider<GlobalBloc>.value(
// // //       value: globalBloc,
// // //       child: MaterialApp(
// // //         theme: ThemeData(
// // //           primarySwatch: Colors.green,
// // //           brightness: Brightness.light,
// // //         ),
// // //         home: MedHomePage(),
// // //         debugShowCheckedModeBanner: false,
// // //       ),
// // //     );
// // //   }
// // // }

// // class MedicineReminder extends StatelessWidget with NavigationStates{
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //         child: Text(
// //       "Medi-Remider App",
// //       style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
// //     ));
// //   }
// // }

// // // class MedicineReminder extends StatefulWidget  with NavigationStates{
// // //   @override
// // //   _MedicineReminderState createState() => _MedicineReminderState();
// // // }

// // // class _MedicineReminderState extends State<MedicineReminder> {
// // //   GlobalBloc globalBloc;

// // //   void initState() {
// // //     globalBloc = GlobalBloc();
// // //     super.initState();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Provider<GlobalBloc>.value(
// // //       value: globalBloc,
// // //       child: MaterialApp(
// // //         theme: ThemeData(
// // //           primarySwatch: Colors.blue,
// // //           brightness: Brightness.light,
// // //         ),
// // //         home: MedHomePage(),
// // //         debugShowCheckedModeBanner: false,
// // //       ),
// // //     );
// // //   }
// // // }