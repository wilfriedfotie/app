import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/components/quizdialog.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/feature/courses/presentation/widgets/quiz_answer_widget.dart';
import 'package:LASYLAB/models/question.dart';
import 'package:LASYLAB/views/congratulation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart' as TheLogger;

class QuizTest extends StatefulWidget {
  const QuizTest({Key? key}) : super(key: key);

  @override
  _QuizAnswerState createState() => _QuizAnswerState();
}

class _QuizAnswerState extends State<QuizTest> with TickerProviderStateMixin {
  AnimationController? animationcontroller;
  List<Question>? quest = [];
  String selectedUserResponse = "";
  PageController? pageController;
  int indexpage = 0;
  int nbretrouves = 0;
  double ratio = 0;

  @override
  void dispose() {
    animationcontroller!.dispose();
    pageController!.dispose();

    super.dispose();
  }

  playMusic(String path) async {}

  pauseMusic() async {}

  int i = 0;
  void nextPage() {
    setState(() {
      i++;
      selectedUserResponse = "";
      ratio = i / quest!.length;
      TheLogger.Logger().d(ratio);
    });

    pageController!.animateToPage(pageController!.page!.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: screenSize.width,
            height: 9,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: LinearProgressIndicator(
                value: ratio,
                valueColor: AlwaysStoppedAnimation<Color>(
                  HexColor("#58CC02"),
                ),
                backgroundColor: HexColor("#E5E5E5"),
              ),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: quest != null && quest!.length != 0
                ? Expanded(
                    child: Container(
                      height: screenSize.height * .7,
                      decoration: BoxDecoration(
                          color: AppTheme.whiteColor,
                          borderRadius: BorderRadius.circular(21)),
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: quest!.length,
                          allowImplicitScrolling: false,
                          pageSnapping: false,
                          controller: pageController,
                          onPageChanged: (page) {
                            setState(() {
                              indexpage = page + 1;
                            });
                          },
                          itemBuilder: (context, index) {
                            var q = quest![index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenSize.width * .05),
                              child: new ListView(
                                children: [
                                  SizedBox(
                                    height: screenSize.height * .05,
                                  ),
                                  Text(
                                    "${q.texte}",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.textBlackV2Color,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * .15,
                                  ),
                                  ...q.reponses!
                                      .map(
                                        (e) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedUserResponse = e.id!;
                                                });
                                              },
                                              child: QuizTestAnswer(
                                                  screenSize: screenSize,
                                                  title: e.texte ?? "",
                                                  selectedUserResponse:
                                                      selectedUserResponse,
                                                  id: e.id ?? ""),
                                            )
                                            // SizedBox(
                                            //   height: 30,
                                            //   child: OutlinedButton(
                                            //     child: Row(
                                            //       children: [
                                            //         Padding(
                                            //           padding: const EdgeInsets
                                            //                   .symmetric(
                                            //               horizontal: 10),
                                            //           child: Text(
                                            //             "${e.etiquette} ) ",
                                            //             textAlign:
                                            //                 TextAlign.justify,
                                            //             style:
                                            //                 GoogleFonts.openSans(
                                            //               color: Colors.black,
                                            //               textStyle: TextStyle(
                                            //                 fontSize: 16,
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ),
                                            //         Expanded(
                                            //           child: Text(
                                            //             "${e.texte}",
                                            //             textAlign:
                                            //                 TextAlign.center,
                                            //             style:
                                            //                 GoogleFonts.openSans(
                                            //               color: Colors.black,
                                            //               textStyle: TextStyle(
                                            //                 fontSize: 16,
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //     style: OutlinedButton.styleFrom(
                                            //       primary: Colors.teal,
                                            //       backgroundColor:
                                            //           selectedUserResponse == e.id
                                            //               ? HexColor("#58CC02")
                                            //                   .withOpacity(.5)
                                            //               : null,
                                            //       shape: RoundedRectangleBorder(
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 16.0),
                                            //       ),
                                            //     ),
                                            //     onPressed: () {
                                            //       setState(() {
                                            //         selectedUserResponse = e.id!;
                                            //       });
                                            //     },
                                            //   ),
                                            // ),
                                            ),
                                      )
                                      .toList(),
                                  SizedBox(height: screenSize.height * .07),
                                  SizedBox(
                                    height: screenSize.height * .065,
                                    width: double.infinity,
                                    child: FancyButton(
                                      child: Center(
                                        child: Text(
                                          "Continuer",
                                          style: GoogleFonts.openSans(
                                            color: Colors.white,
                                            textStyle: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      size: 18,
                                      color: HexColor("#58CC02"),
                                      onPressed: () async {
                                        if (selectedUserResponse.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Veuillez choisir une réponse",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 4,
                                              backgroundColor:
                                                  HexColor("#58CC02"),
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        } else {
                                          if (selectedUserResponse ==
                                              q.correct!.id) {
                                            setState(() {
                                              nbretrouves = nbretrouves + 1;
                                            });
                                            showModalBottomSheet<void>(
                                                context: context,
                                                isDismissible: false,
                                                builder:
                                                    (BuildContext context) {
                                                  return QuizDialog(
                                                    height:
                                                        screenSize.height * .2,
                                                    backgroundcolor:
                                                        HexColor("#58CC02")
                                                            .withOpacity(.1),
                                                    foregroundcolor:
                                                        HexColor("#58CC02")
                                                            .withOpacity(.8),
                                                    texte: "Bonne réponse",
                                                    onpress: () {
                                                      if (indexpage ==
                                                          quest!.length) {
                                                        TheLogger.Logger().d(
                                                            "nbretrouves $nbretrouves : nbretotal $indexpage");

                                                        Navigator
                                                            .pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Congratulations(
                                                                    nbretrouves:
                                                                        nbretrouves,
                                                                    nbretotal:
                                                                        indexpage,
                                                                    questions:
                                                                        quest,
                                                                  )),
                                                          (route) => false,
                                                        );
                                                      } else {
                                                        Navigator.pop(context);
                                                        nextPage();
                                                      }
                                                    },
                                                  );
                                                });
                                          } else {
                                            showModalBottomSheet<void>(
                                                context: context,
                                                isDismissible: false,
                                                builder:
                                                    (BuildContext context) {
                                                  return QuizDialog(
                                                    height:
                                                        screenSize.height * .6,
                                                    backgroundcolor:
                                                        HexColor("#FFDFE0"),
                                                    foregroundcolor:
                                                        HexColor("#FF4B4B"),
                                                    texte: "Mauvais réponse",
                                                    onpress: () {
                                                      if (indexpage ==
                                                          quest!.length) {
                                                        TheLogger.Logger().d(
                                                            "nbretrouves $nbretrouves : nbretotal $indexpage");
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Congratulations(
                                                                          nbretrouves:
                                                                              nbretrouves,
                                                                          nbretotal:
                                                                              indexpage,
                                                                          questions:
                                                                              quest,
                                                                        )));
                                                      } else {
                                                        Navigator.pop(context);
                                                        nextPage();
                                                      }
                                                    },
                                                  );
                                                });
                                          }
                                        }
                                      },
                                      duration:
                                          const Duration(milliseconds: 160),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                : Center(
                    child: SpinKitWave(
                      color: AppTheme.successColor, // HexColor("#235390"),
                      size: 25,
                      controller: animationcontroller,
                    ),
                  )),
      ),
    );
  }
}
