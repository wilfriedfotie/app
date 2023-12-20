import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/feature/courses/presentation/widgets/quiz_response_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeQuizAnswer extends StatefulWidget {
  const SeeQuizAnswer({Key? key}) : super(key: key);

  @override
  _SeeQuizAnswerState createState() => _SeeQuizAnswerState();
}

class _SeeQuizAnswerState extends State<SeeQuizAnswer> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppTheme.scaffoldBgColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height * .03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * .05),
                      child: Container(
                        width: double.maxFinite,
                        height: screenSize.height * .8,
                        padding: EdgeInsets.only(
                          left: screenSize.width * .05,
                          right: screenSize.width * .05,
                          top: screenSize.height * .02,
                        ),
                        decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            borderRadius: BorderRadius.circular(21)),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            ...[1, 2, 3, 5, 6]
                                .map((e) => Column(
                                      children: [
                                        SizedBox(
                                          height: screenSize.height * .03,
                                        ),
                                        Container(
                                          height:
                                              dimensH(screenSize.height * .22),
                                          width: double.maxFinite,
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  screenSize.width * .04,
                                              vertical:
                                                  screenSize.height * .03),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color: AppTheme.grayColor),
                                          ),
                                          child: QuizResponseItem(
                                              screenSize: screenSize),
                                        ),
                                      ],
                                    ))
                                .toList(),
                            SizedBox(
                              height: screenSize.height * .05,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: screenSize.width * .25,
                top: screenSize.height * .0065,
                child: Container(
                  height: dimensH(35, sm: 45),
                  width: screenSize.width * .5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppTheme.warningColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Reponse au quiz".toUpperCase(),
                    style: TextStyle(
                        fontSize:
                            dimensH(2.75 * SizeConfig.textMultiplier, sm: 16),
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts.openSans().fontFamily),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
