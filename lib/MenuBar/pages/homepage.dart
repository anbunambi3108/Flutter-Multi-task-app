import 'package:flutter/material.dart';
// import 'package:navbar_drawer/1.MainPage/onboardingdata.dart';
// import 'package:navbar_drawer/1.MainPage/screens.dart';
import 'package:final_proj/MenuBar/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:final_proj/1.MainPage/Ui/styles.dart';
import 'package:final_proj/1.MainPage/Ui/colorprovider.dart';
import 'package:final_proj/1.MainPage/Onboarding-Pages/onboarding.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnBoarding Demo',
      theme: appTheme(),
      home: MainHomePage(),
    );
  }
}

class MainHomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: missing_required_param
      body: ChangeNotifierProvider(
        builder: (context) => ColorProvider(),
        child: Onboarding(),
      ),
    );
  }
}

// class TestScreen extends StatelessWidget with NavigationStates{
//   final List<OnbordingData> list = [
//     OnbordingData(
//       imagePath: "assets/homepageImgs/task-planner.png",
//       title: "Task-Planner",
//       desc:
//       "Utilize you day productively by organizing and planning your tasks",
//     ),
//     OnbordingData(
//       imagePath: "assets/homepageImgs/medicine-reminder.png",
//       title: "Medicine-Reminder",
//       desc:
//       "don't forget to take your regular tablets and stay healthy",
//     ),
//     OnbordingData(
//       imagePath: "assets/homepageImgs/health-tipper.png",
//       title: "Health-Tipper",
//       desc:
//       "Healthy tips are given here..  Thanks enjoy the app ......bye....",
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return  IntroScreen(
//       list, MaterialPageRoute(builder: (context) => TestScreen()),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:navbar_drawer/bloc.navigation_bloc/navigation_bloc.dart';

// class HomePage extends StatelessWidget with NavigationStates{
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Text(
//       "Home Page",
//       style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
//     ));
//   }
// }
