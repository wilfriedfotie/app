import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/images.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/feature/courses/data/mocks/fake_subjects_quiz.dart';
import 'package:LASYLAB/feature/courses/presentation/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoCourseReading extends StatefulWidget {
  static const routeName = "/course_status";
  const VideoCourseReading({Key? key}) : super(key: key);

  @override
  _VideoCourseReadingState createState() => _VideoCourseReadingState();
}

class _VideoCourseReadingState extends State<VideoCourseReading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;
  bool isVideoReading = true;
  final topic = fakeSubjectQuizzes;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 999));
    _colorTween =
        ColorTween(begin: AppTheme.blueColor, end: AppTheme.warningColor)
            .animate(_animationController);
    changeColors();
    super.initState();
  }

  Future changeColors() async {
    while (true) {
      await new Future.delayed(const Duration(seconds: 1), () {
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
        backgroundColor: isVideoReading == true
            ? AppTheme.whiteColor
            : AppTheme.scaffoldBgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            isVideoReading == true
                ? Navigator.pop(context)
                : setState(() {
                    isVideoReading = true;
                  });
          },
          icon: Icon(
            Icons.close,
            color: AppTheme.borderColor,
            size: 35,
          ),
        ),
        centerTitle: true,
        title: !isVideoReading
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: screenSize.width,
                height: 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: LinearProgressIndicator(
                    value: 0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xff58CC02),
                    ),
                    backgroundColor: Color(0xffE5E5E5),
                  ),
                ),
              )
            : GestureDetector(
                onHorizontalDragStart: (detail) {
                  setState(() {
                    isVideoReading = true;
                  });
                },
                child: Text(
                  "Introduction",
                  style: TextStyle(
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      color: AppTheme.textBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ));
    return Scaffold(
      backgroundColor: isVideoReading == true
          ? AppTheme.whiteColor
          : AppTheme.scaffoldBgColor,
      appBar: appBar,
      body: isVideoReading == true
          ? SafeArea(
              child: Stack(
                children: [
                  Container(
                    height: screenSize.height - appBar.preferredSize.height,
                    alignment: Alignment.center,
                    color: AppTheme.blueColor,
                    child: VideoApp(link: topic[1].video!),
                  ),
                  Positioned(
                    bottom: dimensH(0),
                    left: screenSize.width * .4,
                    child: GestureDetector(
                      onHorizontalDragDown: (value) {
                        print("the tapdata : $value");
                        setState(() {
                          isVideoReading = false;
                        });
                        // Navigator.of(context).pushNamed("/course_reading");
                      },
                      child: Container(
                        height: dimensH(screenSize.height * .13,
                            sm: screenSize.height * .1),
                        width: screenSize.width * .2,
                        decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AnimatedBuilder(
                              animation: _colorTween,
                              builder: (context, child) => Image.asset(
                                  Images.arrow_video_status,
                                  color: _colorTween.value),
                            ),
                            SizedBox(
                              height: dimensH(screenSize.height * .02,
                                  sm: screenSize.height * .01),
                            ),
                            Text("QCM",
                                style: TextStyle(
                                    fontSize: dimensH(
                                        2.5 * SizeConfig.textMultiplier,
                                        sm: 18),
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: dimensH(5),
                      right: screenSize.width * .02,
                      child: InkWell(
                        onTap: () {
                          print("download the course");
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(left: 8, bottom: 8),
                          padding: EdgeInsets.symmetric(
                              vertical: dimensH(10, sm: 7)),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.warningColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.blackColor,
                                offset: Offset(0.0, 2.0), //(x,y)
                                blurRadius: 4.0,
                              ),
                            ],
                          ),
                          child: Image(
                            image: AssetImage(Images.download_file_icon),
                          ),
                        ),
                      ))
                ],
              ),
            )
          : SafeArea(
              child: GestureDetector(
                onHorizontalDragStart: (detail) {
                  setState(() {
                    isVideoReading = true;
                  });
                },
                child: Stack(
                  children: [
                    Container(
                      height: screenSize.height * .8,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.symmetric(
                          horizontal: screenSize.width * .045),
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * .05,
                          vertical: screenSize.height * .02),
                      decoration: BoxDecoration(
                          color: AppTheme.whiteColor,
                          borderRadius: BorderRadius.circular(21)),
                      child: GestureDetector(
                        onHorizontalDragStart: (detail) {
                          setState(() {
                            isVideoReading = true;
                          });
                        },
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
                                        .quizs[2]
                                        .proposition
                                        .map((e) => Container(
                                              width: double.infinity,
                                              margin:
                                                  const EdgeInsets.only(top: 8),
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, top: 8),
                                              child: FancyButton(
                                                size: 18,
                                                duration: const Duration(
                                                    milliseconds: 160),
                                                onPressed: () {
                                                  setState(() {});
                                                },
                                                child: Center(
                                                    child: Text(
                                                  e,
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 22),
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
                              "Voir les reponses",
                              style: GoogleFonts.openSans(
                                color: AppTheme.whiteColor,
                                textStyle: TextStyle(
                                  fontSize: dimensH(
                                      2.8 * SizeConfig.textMultiplier,
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
}
