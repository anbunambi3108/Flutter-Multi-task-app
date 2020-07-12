import 'package:flutter/material.dart';
import 'package:final_proj/1.MainPage/Ui/colorprovider.dart';
import 'package:final_proj/1.MainPage/Onboarding-Pages/onboard_page.dart';
import 'package:final_proj/1.MainPage/Onboarding-Datas/onboard_page_data.dart';
import 'package:final_proj/1.MainPage/Ui/page_view_indicator.dart';
import 'package:final_proj/MenuBar/pages/task-planner.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = Provider.of<ColorProvider>(context);
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: onboardData.length,
          itemBuilder: (context, index) {
            return OnboardPage(
              pageController: pageController,
              pageModel: onboardData[index],
            );
          },
        ),
        Container(
          width: double.infinity,
          height: 90,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only (left:40.0),
                  child: Text(
                    'APP NAME',
                    // ignore: deprecated_member_use
                    style: TextStyle(
                      color: colorProvider.color,
                      fontWeight: FontWeight.w900,
                      fontSize: 29.0
                    )
                  ),
                ),
                new FlatButton(
                    child: new Text("SKIP",
                        style:
                            // ignore: deprecated_member_use
                            Theme.of(context).textTheme.title.copyWith(
                                  color: colorProvider.color,
                                )),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new TaskPlanner()));
                    }),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80.0, left: 40),
            child: PageViewIndicator(
              controller: pageController,
              itemCount: onboardData.length,
              color: colorProvider.color,
            ),
          ),
        )
      ],
    );
  }
}
