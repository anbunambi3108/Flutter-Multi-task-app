import 'package:bloc/bloc.dart';
import 'package:final_proj/MenuBar/pages/homepage.dart';
import 'package:final_proj/MenuBar/pages/about.dart';
import 'package:final_proj/MenuBar/pages/health-tipper.dart';
import 'package:final_proj/MenuBar/pages/medi-reminder.dart';
import 'package:final_proj/MenuBar/pages/task-planner.dart';
//import 'package:flutter/material.dart';
// import 'package:navbar_drawer/MainHomePage/onboardingdata.dart';
// import 'package:navbar_drawer/MainHomePage/onboardingscreens.dart';

enum NavigationEvents{
  HomePageClickedEvent,
  TaskPlannerClickedEvent,
  MediReminderClickedEvent,
  HealthTipperClickedEvent,
  AboutPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => MainHomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield MainHomePage();
        break;
      case NavigationEvents.TaskPlannerClickedEvent:
        yield TaskPlanner();
        break;
      case NavigationEvents.MediReminderClickedEvent:
        yield MedApp();
        break;
      case NavigationEvents.HealthTipperClickedEvent:
        yield TipperApp();
        break;
      case NavigationEvents.AboutPageClickedEvent:
        yield About();
        break;
    }
  }
}