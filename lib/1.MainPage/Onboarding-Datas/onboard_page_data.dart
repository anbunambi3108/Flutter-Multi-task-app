import 'dart:ui';
import 'package:final_proj/1.MainPage/Onboarding-Datas/onboard_page_model.dart';

List<OnboardPageModel> onboardData = [
  OnboardPageModel(
    Color(0xFFE6E6E6), //front bg
    Color(0xFF005699), //back bg
    Color(0xFFE6E6E6),
    2,
    'assets/todo1.jpg',
    'TASK-PLANNER',
    'Design your perfect day',
  ),
  OnboardPageModel(
    Color(0xFF005699), //front bg
    Color(0xFFE6E6E6), //back bg
    Color(0xFFFFE074),
    2,
    'assets/meds.jpg',
    'MEDICINE REMINDER',
    'Staying healthy and getting your medications on time is vital.Using this you can set reminders and take your medication on time',
  ),
  OnboardPageModel(
    Color(0xFF39393A), //front bg
    Color(0xFFFFE074), //back bg
    Color(0xFFFFE074),
    0,
    'assets/health.jpg',
    'HEALTH TIPPER',
    'Nothing is more important than your health',
  ),
  
];
