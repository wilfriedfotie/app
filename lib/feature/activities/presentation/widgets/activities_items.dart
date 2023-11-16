import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ActivitiesItem extends StatefulWidget {
  final String courseName;
  final String description;
  final String illustration;

  const ActivitiesItem({
    Key? key,
    required this.courseName,
    required this.description,
    required this.illustration,
  }) : super(key: key);

  @override
  State<ActivitiesItem> createState() => _ActivitiesItemState();
}

class _ActivitiesItemState extends State<ActivitiesItem> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed("/quiz_answer");
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppTheme.grayColor,
              offset: Offset(0.0, 2.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: dimensH(screenSize.width * 0.12,
                    sm: screenSize.width * 0.20),
                width: dimensW(screenSize.width * 0.10,
                    sm: screenSize.width * 0.20),
                child: Image.asset(widget.illustration),
              ),
            ),
            Text(
              widget.courseName.toUpperCase(),
              style: GoogleFonts.nunito(
                color: Colors.black,
                textStyle: TextStyle(
                  fontSize: dimensH(1.73 * SizeConfig.textMultiplier, sm: 13),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * .025,
            ),
            Text(
              widget.description,
              style: GoogleFonts.nunito(
                color: Color(0xffCCCCCC),
                textStyle: TextStyle(
                  fontSize: dimensH(1.73 * SizeConfig.textMultiplier, sm: 13),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
