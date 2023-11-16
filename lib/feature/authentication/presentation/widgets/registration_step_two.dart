import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Widget StepTwo(
    {required int step,
    required Function selectClass,
    required Size screenSize,
    required int studentClass}) {
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
              child: IconButton(
                iconSize: 24,
                color: AppTheme.borderColor,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    step = 1;
                  });
                },
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 12,
          ),
          child: Container(
            height: 72,
            width: 141,
            child: Image.asset(
              "assets/images/splash.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(
          "Crée ton compte",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: AppTheme.textBlackColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "En quelle classe es-tu\n[2021-2022]",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xff4B4B4B),
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * .01,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * .01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...[6, 5, 4, 3]
                    .map((e) => InkWell(
                          onTap: () {
                            selectClass(e);
                          },
                          child: Container(
                            height: screenSize.height * .06,
                            width: screenSize.width * .15,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: studentClass == e
                                    ? AppTheme.primaryLightColor
                                    : AppTheme.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: studentClass == e
                                        ? AppTheme.secondaryColor
                                        : AppTheme.borderColor)),
                            child: Text(e.toString() + "e",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: studentClass == e
                                        ? AppTheme.secondaryColor
                                        : AppTheme.textBlackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20)),
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * .01,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * .206),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...[1, 2]
                    .map((e) => InkWell(
                          onTap: () {
                            selectClass(e);
                          },
                          child: Container(
                            height: screenSize.height * .06,
                            width: screenSize.width * .15,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: studentClass == e
                                    ? AppTheme.primaryLightColor
                                    : AppTheme.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: studentClass == e
                                        ? AppTheme.secondaryColor
                                        : AppTheme.borderColor)),
                            child: Text(
                                e == 1
                                    ? e.toString() + "ère"
                                    : e.toString() + "nde",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: studentClass == e
                                        ? AppTheme.secondaryColor
                                        : AppTheme.textBlackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20)),
                          ),
                        ))
                    .toList()
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * .01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * .05),
          child: InkWell(
            onTap: () {
              selectClass(7);
            },
            child: Container(
              height: screenSize.height * .06,
              width: screenSize.width * .15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: studentClass == 7
                      ? AppTheme.primaryLightColor
                      : AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: studentClass == 7
                          ? AppTheme.secondaryColor
                          : AppTheme.borderColor)),
              child: Text("Tle",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: studentClass == 7
                          ? AppTheme.secondaryColor
                          : AppTheme.textBlackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 20)),
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * .15,
        ),
        Container(
          color: Colors.white,
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 15,
            bottom: 30,
          ),
          child: SizedBox(
            height: screenSize.height * .06,
            width: double.infinity,
            child: FancyButton(
              child: Center(
                child: Text(
                  "Continuer",
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              size: 18,
              color: HexColor("#58CC02"),
              onPressed: () {
                if (studentClass != 0)
                  setState(() {
                    step = 3;
                  });
              },
              duration: const Duration(milliseconds: 160),
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * .05,
        ),
      ],
    ),
  );
}
