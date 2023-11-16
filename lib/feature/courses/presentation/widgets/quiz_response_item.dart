import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget QuizResponseItem({
  required Size screenSize,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IntrinsicWidth(
          child: IntrinsicHeight(
            child: Container(
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.height * .02,
                      ),
                      Container(
                        height: screenSize.height * .05,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppTheme.grayColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "C'est une équation",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.openSans().fontFamily),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: screenSize.height * .03,
                    width: screenSize.width * .25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppTheme.warningColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Question 1",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.openSans().fontFamily),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        IntrinsicWidth(
          child: IntrinsicHeight(
            child: Container(
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.height * .02,
                      ),
                      Container(
                        height: screenSize.height * .05,
                        width: double.maxFinite,
                        padding: EdgeInsets.only(left: screenSize.width * .05),
                        decoration: BoxDecoration(
                            color: Color(0xff84D8FF),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Container(
                              height: dimensH(20, sm: 25),
                              width: dimensW(20, sm: 25),
                              padding: EdgeInsets.only(top: 5),
                              child: CircleAvatar(
                                backgroundColor: Color(0xffD9D9D9),
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: dimensH(
                                          1.7 * SizeConfig.textMultiplier,
                                          sm: 14),
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width * .068,
                            ),
                            Text(
                              "C'est ax + b + c",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily:
                                      GoogleFonts.openSans().fontFamily),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: screenSize.height * .03,
                    width: screenSize.width * .25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppTheme.warningColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Réponse ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.openSans().fontFamily),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
