import 'package:flutter/material.dart';
import 'package:final_proj/4.HealthTipper/Tipper_mainPage/mainpage.dart';
import 'package:final_proj/4.HealthTipper/Tipper_onboarding/model.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<StepModel> list = StepModel.list;
  var _controller = PageController();
  var initialPage = 0;
  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        initialPage = _controller.page.round();
      });
    });

    return Scaffold(
        body: Column(children: <Widget>[
      _appBar(),
      _body(_controller),
      _indicator(),
    ]));
  }

  _appBar() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (initialPage > 0)
                _controller.animateToPage(initialPage - 1,
                    duration: Duration(microseconds: 3000),
                    curve: Curves.easeIn);
            },
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withAlpha(50),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                child: Icon(Icons.arrow_back_ios)),
          ),
          FlatButton(
              onPressed: () {
                if (initialPage < list.length)
                  _controller.animateToPage(list.length,
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeInOut);
                if (initialPage == 3)
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => new TipperMainPage()));
              },
              child: Text(initialPage < 3 ? "SKIP" : "GOT IT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.indigo[900])))
        ],
      ),
    );
  }

  _body(PageController controller) {
    return Expanded(
        child: PageView.builder(
      controller: controller,
      itemCount: StepModel.list.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            index == 1
                ? displayText(StepModel.list[index].text)
                : displayImage(StepModel.list[index].id),
            SizedBox(
              height: 12,
            ),
            index == 1
                ? displayImage(StepModel.list[index].id)
                : displayText(StepModel.list[index].text)
          ],
        );
      },
    ));
  }

  _indicator() {
    return Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.purple),
                  value: (initialPage + 1) / (StepModel.list.length),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  if (initialPage < list.length)
                    _controller.animateToPage(initialPage + 1,
                        duration: Duration(microseconds: 800),
                        curve: Curves.elasticIn);
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  displayText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    );
  }

  displayImage(int path) {
    return Image.asset(
      "assets/$path.jpg",
      height: MediaQuery.of(context).size.height * 0.5,
    );
  }
}
