import 'package:LASYLAB/core/components/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget QuizTestAnswer(
        {required Size screenSize,
        required String selectedUserResponse,
        required String id,
        required String title}) =>
    StatefulBuilder(
        builder: (context, setState) => Container(
              height: screenSize.height * .07,
              width: screenSize.width * .75,
              decoration: BoxDecoration(
                  color: selectedUserResponse == id
                      ? AppTheme.blueLightColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(
                      width: 1,
                      color: selectedUserResponse == id
                          ? AppTheme.blueColor
                          : Color(0xffCCCCCC),
                      style: BorderStyle.solid)),
              alignment: Alignment.center,
              child: Text(
                "$title",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                ),
              ),
            ));
