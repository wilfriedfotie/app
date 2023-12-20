import 'package:LASYLAB/core/components/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget StepOne({required Size screenSize, required int step}) {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) =>
        Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: BackButton(
              color: AppTheme.borderColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "SCHOOLIFE",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: screenSize.height * .04,
              ),
              Center(
                child: Text(
                  "Crée ton compte",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textBlackColor),
                ),
              ),
              SizedBox(
                height: screenSize.height * .02,
              ),
              Text(
                "Si vous abonnez votre enfant,\nchoisissez le profil parent.",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff4B4B4B)),
              ),
              SizedBox(
                height: screenSize.height * .07,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * .03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              step = 2;
                            });
                          },
                          child: Container(
                            height: screenSize.height * .15,
                            width: screenSize.width * .3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: AppTheme.borderColor),
                                color: AppTheme.primaryLightColor),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * .01,
                        ),
                        Text("Eleve",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textBlackColor))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              step = 2;
                            });
                          },
                          child: Container(
                            height: screenSize.height * .15,
                            width: screenSize.width * .3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: AppTheme.borderColor),
                                color: AppTheme.whiteColor),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * .01,
                        ),
                        Text("Parent",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.textBlackColor))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        SizedBox(
          height: screenSize.height * .3,
        ),
      ],
    ),
  );
}
