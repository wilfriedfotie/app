import 'package:LASYLAB/core/components/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CourseItem extends StatefulWidget {
  final String courseName;
  final Color backgroundColor;
  final String image;
  final double progression;

  const CourseItem({
    Key? key,
    required this.courseName,
    required this.backgroundColor,
    required this.image,
    required this.progression,
  }) : super(key: key);

  @override
  State<CourseItem> createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
  //late PopupMenu menu;
  GlobalKey btnKey = GlobalKey();
  GlobalKey btnKey2 = GlobalKey();
  GlobalKey btnKey3 = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Material(
            child: InkWell(
              highlightColor: AppTheme.textBlueColor.withOpacity(.5),
              splashColor: AppTheme.primaryColor.withOpacity(.5),
              onTap: () {
                Navigator.of(context).pushNamed("/revisions");
              },
              child: Ink(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.21,
                      height: screenSize.width * 0.21,
                      child: CircularProgressIndicator(
                        strokeWidth: screenSize.width * 0.20 > 90 ? 10 : 8,
                        backgroundColor: HexColor("#D2E4E8"),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          HexColor("#FFD900"),
                        ),
                        value: widget.progression,
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.2,
                      height: screenSize.width * 0.2,
                      child: CircleAvatar(
                        backgroundColor: widget.backgroundColor,
                        child: SizedBox(
                          height: screenSize.width * 0.1,
                          width: screenSize.width * 0.1,
                          child: Image.asset(widget.image),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Text(
          widget.courseName,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.openSans().fontFamily),
        ),
      ],
    );
  }
}
