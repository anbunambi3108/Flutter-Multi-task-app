import 'package:flutter/material.dart';
import 'package:final_proj/2.TaskPlanner/Task-plan_Sliders/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage(slideList[index].imageUrl),
                fit: BoxFit.fill,
              )),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(18),
          child: Text(
            "fgfjbhg dhgidoazhdsnf dfh dsighidgndn  dsbfudufhduh ds cnidi iidmba  huef fhid apolssfu qe fgfjbhg dhgidoazhdsnf dfh dsighidgndn  dsbfudufhduh ds cnidi iidmba  huef fhid apolssfu qe",
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
