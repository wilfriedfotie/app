import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/components/quizdialog.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/views/congratulation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart' as TheLogger;
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/feature/courses/data/mocks/fake_subjects_quiz.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../data/models/response/quiz_response.dart';

class QuizTestWidget extends StatefulWidget {
  static const routeName = "/quiz_test_widget";
  const QuizTestWidget({Key? key}) : super(key: key);

  @override
  _QuizTestWidgetState createState() => _QuizTestWidgetState();
}

class _QuizTestWidgetState extends State<QuizTestWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final topic = fakeSubjectQuizzes;
  final _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
  int nbretrouves = 0, currentSelected = 0;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 999));
    changeColors();
    super.initState();
  }

  Future changeColors() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 1), () {
        if (_animationController.status == AnimationStatus.completed) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    AppBar appBar = AppBar(
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
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: screenSize.width,
          height: 9,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: LinearProgressIndicator(
              value: ((currentSelected == 0 ? 1 : currentSelected) /
                  topic[2].quizs.length),
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xff58CC02),
              ),
              backgroundColor: Color(0xffE5E5E5),
            ),
          ),
        ));
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBgColor,
      appBar: appBar,
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragStart: (detail) {},
          child: Stack(
            children: [
              Container(
                height: screenSize.height * .8,
                alignment: Alignment.topCenter,
                margin:
                    EdgeInsets.symmetric(horizontal: screenSize.width * .045),
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * .05,
                    vertical: screenSize.height * .02),
                decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(21)),
                child: GestureDetector(
                  onHorizontalDragStart: (detail) {},
                  child: ListView(
                    children: [
                      Center(
                        child: Text(
                          topic[2].quizs.first.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                              children: topic[2]
                                  .quizs[currentSelected]
                                  .proposition
                                  .map((e) => Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(top: 8),
                                        padding: const EdgeInsets.only(
                                            right: 8.0, top: 8),
                                        child: FancyButton(
                                          size: 18,
                                          duration:
                                              const Duration(milliseconds: 160),
                                          onPressed: () {
                                            if (topic[2]
                                                    .quizs[currentSelected]
                                                    .correctAnswer ==
                                                e) {
                                              _audioPlayer.play(AssetSource(
                                                  'audio/duolingo_correct.mp3'));

                                              _quizAnswer(
                                                  isSussess: true,
                                                  quiz: topic[2]
                                                      .quizs[currentSelected]);
                                            } else {
                                              _audioPlayer.play(AssetSource(
                                                  'audio/duolingo_false.mp3'));

                                              _quizAnswer(
                                                  isSussess: false,
                                                  quiz: topic[2]
                                                      .quizs[currentSelected]);
                                            }
                                          },
                                          child: Center(
                                              child: Text(
                                            e,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 22),
                                          )),
                                          color: false
                                              ? AppTheme.secondaryLightBg
                                              : AppTheme.whiteColor,
                                        ),
                                      ))
                                  .toList()))
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: screenSize.width * .18,
                child: SizedBox(
                  height: screenSize.height * .07,
                  width: screenSize.width * .6,
                  child: FancyButton(
                    child: Center(
                      child: Text(
                        "Voir les réponses",
                        style: GoogleFonts.openSans(
                          color: AppTheme.whiteColor,
                          textStyle: TextStyle(
                            fontSize: dimensH(2.8 * SizeConfig.textMultiplier,
                                sm: 20),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    size: 18,
                    color: AppTheme.primaryColor,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/see_answer_quiz");
                    },
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _animationController.dispose();
    super.dispose();
  }

  _quizAnswer({required bool isSussess, required QuizResponse quiz}) {
    if (isSussess) {
      setState(() {
        nbretrouves++;
      });
      showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          builder: (BuildContext context) {
            return QuizDialog(
              height: 300,
              backgroundcolor: HexColor("#58CC02").withOpacity(.1),
              foregroundcolor: HexColor("#58CC02").withOpacity(.8),
              texte: "Bonne réponse",
              onpress: () {
                nextPage(quiz);
              },
            );
          });
    } else {
      showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          builder: (BuildContext context) {
            return QuizDialog(
              height: 300,
              backgroundcolor: HexColor("#FFDFE0"),
              foregroundcolor: HexColor("#FF4B4B"),
              texte: "Mauvais réponse",
              onpress: () {
                nextPage(quiz);
              },
            );
          });
    }
  }

  nextPage(QuizResponse quiz) {
    if (topic[2].quizs.indexOf(quiz) == topic[2].quizs.length - 1) {
      TheLogger.Logger()
          .d("nbretrouves $nbretrouves : nbretotal ${topic[2].quizs.length}");
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Congratulations(
                nbretrouves: nbretrouves,
                nbretotal: topic[2].quizs.length,
              )));
    } else {
      Navigator.pop(context);
      setState(() {
        currentSelected++;
      });
      // nextPage(topic[2].quizs[topic[2].quizs.indexOf(quiz) + 1]);
    }
  }
}
