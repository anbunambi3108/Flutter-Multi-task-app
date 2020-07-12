import 'package:flutter/material.dart';
import 'package:final_proj/MenuBar/bloc.navigation_bloc/navigation_bloc.dart';

class About extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "About page",
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
    ));
  }
}
