import 'package:LASYLAB/core/components/images.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressCourseBar extends StatefulWidget {
  final bool isReading;
  // final String title;
  const ProgressCourseBar({Key? key, required this.isReading})
      : super(key: key);

  @override
  _ProgressCourseBarState createState() => _ProgressCourseBarState();
}

class _ProgressCourseBarState extends State<ProgressCourseBar> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color:
                  widget.isReading ? AppTheme.warningColor : Color(0xffF7F1ED),
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            "Introduction",
            style: TextStyle(
                fontSize: dimensH(1.8 * SizeConfig.textMultiplier, sm: 14),
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.openSans().fontFamily),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/course_status");
              },
              highlightColor: AppTheme.textBlueColor.withOpacity(.5),
              splashColor: AppTheme.primaryColor.withOpacity(.5),
              child: Ink(
                height: screenSize.height * .09,
                width: screenSize.width * .19,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 5, color: Color(0xffF7F1ED)),
                    // borderRadius: BorderRadius.circular(50),
                    color: widget.isReading
                        ? AppTheme.warningColor
                        : AppTheme.whiteColor),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 20, top: 8, bottom: 8),
                  child: SvgPicture.asset(
                    Images.play_video,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * .23),
          child: Container(
              height: screenSize.height * .11,
              width: 10,
              decoration: BoxDecoration(
                  color: widget.isReading
                      ? AppTheme.warningColor
                      : Color(0xffF7F1ED),
                  borderRadius: BorderRadius.circular(30))),
        )
      ],
    );
  }
}
