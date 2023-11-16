import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseReading extends StatefulWidget {
  const CourseReading({Key? key}) : super(key: key);

  @override
  _CourseReadingState createState() => _CourseReadingState();
}

class _CourseReadingState extends State<CourseReading> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppTheme.scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: AppTheme.scaffoldBgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: AppTheme.borderColor,
            size: 35,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Introduction",
          style: TextStyle(
              fontFamily: GoogleFonts.openSans().fontFamily,
              color: AppTheme.textBlackColor,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: screenSize.height * .8,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(horizontal: screenSize.width * .045),
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * .05,
                vertical: screenSize.height * .02),
            decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(21)),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: "Etapes à suivre pour factoriser un polynôme",
                    style: TextStyle(color: AppTheme.blueColor, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: screenSize.width * .15,
            child: Container(
              height: screenSize.height * .07,
              width: screenSize.width * .7,
              child: FancyButton(
                child: Center(
                  child: Text(
                    "Passez le quiz",
                    style: GoogleFonts.openSans(
                      color: AppTheme.whiteColor,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                size: 18,
                color: AppTheme.primaryColor,
                onPressed: () {
                  Navigator.of(context).pushNamed("/quiz_launcher");
                },
                duration: const Duration(milliseconds: 160),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
