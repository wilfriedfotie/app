import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'activities_items.dart';

class ActivityWidget extends StatefulWidget {
  final Size screenSize;
  final String title;
  const ActivityWidget(
      {Key? key, required this.screenSize, required this.title})
      : super(key: key);

  @override
  _ActivityWidgetState createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${widget.title}".toUpperCase(),
              style: GoogleFonts.nunito(
                color: AppTheme.textBlackV2Color,
                textStyle: TextStyle(
                  fontSize: dimensH(2.75 * SizeConfig.textMultiplier, sm: 18),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Color(0xffE5E5E4),
          width: double.infinity,
          height: 1,
        ),
        GridView.count(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.all(20),
          childAspectRatio:
              (widget.screenSize.width / widget.screenSize.height * 1.7),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: <Widget>[
            ActivitiesItem(
              illustration: "assets/images/pen.png",
              courseName: "Mathématiques",
              description: "MATHS",
            ),
            ActivitiesItem(
              illustration: "assets/images/maths.png",
              courseName: "Mathématiques",
              description: "MATHS",
            ),
            ActivitiesItem(
              illustration: "assets/images/chemistry.png",
              courseName: "Mathématiques",
              description: "MATHS",
            ),
            ActivitiesItem(
              illustration: "assets/images/pen.png",
              courseName: "Mathématiques",
              description: "MATHS",
            ),
          ],
        ),
      ],
    );
  }
}
