import 'package:flutter/material.dart';
import 'package:final_proj/MenuBar/sidebar/sidebar_layout.dart';


void main() => runApp(MenuBar());

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //to remove the top debug label
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.white),
      home: SideBarLayout(),
    );
  }
}
