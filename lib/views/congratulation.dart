import 'dart:math';

import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/images.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/models/question.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Congratulations extends StatefulWidget {
  const Congratulations(
      {Key? key, this.nbretrouves, this.nbretotal, this.questions})
      : super(key: key);
  final int? nbretrouves;
  final int? nbretotal;
  final List<Question>? questions;

  @override
  _CongratulationsState createState() => _CongratulationsState();
}

class _CongratulationsState extends State<Congratulations> {
  late ConfettiController controllerCenter;

  @override
  void initState() {
    super.initState();
    controllerCenter =
        ConfettiController(duration: const Duration(seconds: 30));
    if (mounted) {
      controllerCenter.play();
    }
  }

  @override
  void dispose() {
    controllerCenter.dispose();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBgColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height:
                  dimensH(screenSize.height * .04, sm: screenSize.height * .08),
            ),
            Container(
              height: screenSize.height * .82,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.symmetric(horizontal: screenSize.width * .045),
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(21)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "Félicitations\n\n",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: dimensH(
                                        3.5 * SizeConfig.textMultiplier,
                                        sm: 20),
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.blackColor),
                              ),
                              children: [
                                TextSpan(
                                    text: "Vous avez remporté !",
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontSize: dimensH(
                                              3.5 * SizeConfig.textMultiplier,
                                              sm: 20),
                                          fontWeight: FontWeight.w700,
                                          color: AppTheme.warningColor),
                                    ))
                              ]))),
                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: controllerCenter,
                      blastDirectionality: BlastDirectionality
                          .explosive, // don't specify a direction, blast randomly
                      shouldLoop:
                          true, // start again as soon as the animation is finished
                      colors: const [
                        Colors.green,
                        Colors.blue,
                        Colors.pink,
                        Colors.orange,
                        Colors.purple
                      ], // manually specify the colors to be used
                      // createParticlePath: drawStar, // define a custom shape/path.
                    ),
                  ),
                  SizedBox(
                    height: dimensH(screenSize.height * .01,
                        sm: screenSize.height * .05),
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: dimensH(screenSize.height * .1,
                            sm: screenSize.height * .15),
                        width: dimensW(100),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Images.good_response_icon))),
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            SizedBox(
                              height: dimensH(screenSize.height * .018,
                                  sm: screenSize.height * .025),
                            ),
                            Text(
                              "5",
                              style: TextStyle(
                                  fontSize: dimensH(
                                      3 * SizeConfig.textMultiplier,
                                      sm: 36),
                                  fontFamily: GoogleFonts.openSans().fontFamily,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: dimensW(1, sm: screenSize.width * .025),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: dimensH(screenSize.height * .1, sm: 100),
                            width: dimensW(45, sm: 100),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage(Images.bad_response_icon))),
                          ),
                          Text(
                            "5",
                            style: TextStyle(
                                fontSize: dimensH(3 * SizeConfig.textMultiplier,
                                    sm: 36),
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: dimensH(screenSize.height * .05),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.yellow),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Text(
                              "${widget.nbretrouves ?? 0}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                color: Colors.yellow,
                                textStyle: TextStyle(
                                  fontSize: dimensH(
                                      4.5 * SizeConfig.textMultiplier,
                                      sm: 40),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            " / ",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                              color: Colors.yellow,
                              textStyle: TextStyle(
                                fontSize: dimensH(
                                    4.5 * SizeConfig.textMultiplier,
                                    sm: 40),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text(
                              " ${widget.nbretotal ?? 0}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                color: Colors.yellow,
                                textStyle: TextStyle(
                                  fontSize: dimensH(
                                      4.5 * SizeConfig.textMultiplier,
                                      sm: 40),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * .05),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenSize.height * .07,
                          width: double.infinity,
                          child: FancyButton(
                            child: Center(
                              child: Text(
                                "Voir les reponses",
                                style: GoogleFonts.openSans(
                                  color: AppTheme.primaryColor,
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            size: 18,
                            color: AppTheme.whiteColor,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed("/see_answer_quiz");
                            },
                            duration: const Duration(milliseconds: 160),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * .03,
                        ),
                        SizedBox(
                          height: screenSize.height * .07,
                          width: double.infinity,
                          child: FancyButton(
                            child: Center(
                              child: Text(
                                "Continuer",
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
                              Navigator.of(context).pushNamed("/menu");
                            },
                            duration: const Duration(milliseconds: 160),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
