import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(TipperMainPage());
}

class TipperMainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TipperHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}