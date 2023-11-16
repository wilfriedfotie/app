import 'package:LASYLAB/components/fancy_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CourseStatusReader extends StatefulWidget {
  const CourseStatusReader({Key? key}) : super(key: key);

  @override
  _CourseStatusReaderState createState() => _CourseStatusReaderState();
}

class _CourseStatusReaderState extends State<CourseStatusReader> {
  int page = 0;
  int currentIndex = 0;
  double _variableprogression = 0;
  PageController _controller = PageController(initialPage: 0);
  late final PausableTimer _timer;
  late bool panelOpen = false;

  void statusTimer() {
    _timer = PausableTimer(
      const Duration(milliseconds: 60),
      () {
        if (currentIndex + 1 == contents.length && _variableprogression >= 1) {
          _timer.pause(); // _timer.cancel()
        } else if (_variableprogression >= 1 &&
            currentIndex + 1 != contents.length) {
          _controller.nextPage(
            duration: Duration(milliseconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
          );
          setState(() {
            _variableprogression = 0;
          });
          _timer
            ..reset()
            ..start();
        } else {
          if (mounted) {
            setState(() {
              _variableprogression = _variableprogression + (1 / 100);
              _timer
                ..reset()
                ..start();
            });
          }
        }
      },
    )..start();
  }

  void statusPause() {
    _timer.pause();
  }

  void statusResume() {
    _timer.start();
  }

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    statusTimer();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1CB0F6),
        body: SlidingUpPanel(
          onPanelOpened: () {
            setState(() {
              panelOpen = true;
            });
          },
          onPanelClosed: () {
            setState(() {
              panelOpen = false;
            });
          },
          parallaxEnabled: true,
          borderRadius: BorderRadius.only(
            topLeft: panelOpen ? Radius.circular(0) : Radius.circular(24.0),
            topRight: panelOpen ? Radius.circular(0) : Radius.circular(24.0),
          ),
          color: panelOpen ? Colors.white : Colors.white.withOpacity(0.2),
          minHeight: screenSize.height * 0.07,
          maxHeight: screenSize.height, //screenSize.height * 0.70,
          panel: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  panelOpen
                      ? FontAwesomeIcons.arrowDown
                      : FontAwesomeIcons.arrowUp,
                  color: panelOpen ? Colors.black : Colors.white,
                  size: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: screenSize.height * 0.05,
                  //color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      panelOpen ? "Revenir au slide" : "Réviser le cours",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: panelOpen ? Colors.black : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Étapes à suivre pour factoriser un polynôme",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: HexColor("#1CB0F6"),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Les étapes à suivre pour factoriser un polynôme dépendent du nombre de terme qu'il contient. De façon générale, il convient de toujours s'assurer que le polynôme est factorisé à sa forme la plus complète, c'est pourquoi il peut arriver que plus d'une méthode de factorisation soit effectuée pour un même polynôme.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Cas : binôme",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: HexColor("#1CB0F6"),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Lorsque l'expression à factoriser est un binôme, il est préférable de suivre les étapes suivantes :",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Règle",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: HexColor("#FFCE26"),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          """Effectuer une mise en évidence simple, si c'est possible.

Si le signe entre les deux termes du binôme est une soustraction, vérifier s'il est possible de faire une différence de carrés.""",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          bottom: 200.0,
                          left: 40,
                          right: 40,
                        ),
                        child: SizedBox(
                          height: 45,
                          child: FancyButton(
                            child: Center(
                              child: Text(
                                "Passer le Quiz",
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  textStyle: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            size: 18,
                            color: HexColor("#58CC02"),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed("/quiz_answer"); //quiz_launcher
                            },
                            duration: const Duration(milliseconds: 160),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              //---------------------------------Back-------------------
              Container(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(
                      () {
                        currentIndex = index;
                      },
                    );
                  },
                  itemBuilder: (_, i) {
                    return contents[i];
                  },
                ),
              ),

              //---------------------------------Front-------------------
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 1.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(contents.length + 1, (index) {
                        if (index == contents.length) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 14,
                                height: 14,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  backgroundColor: HexColor("#C4C4C4"),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                  value: 1,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                                height: 12,
                                child: CircleAvatar(
                                  backgroundColor: HexColor("#58CC02"),
                                  child: null,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return new StatusBar(
                            screenSize: screenSize,
                            index: index,
                            progressvalue: index == currentIndex
                                ? _variableprogression
                                : index > currentIndex
                                    ? 0.0
                                    : 1.0,
                          );
                        }
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Equation et inéquation",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //-TAP NEXT PREVEW-//
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onLongPress: statusPause,
                      onLongPressUp: statusResume,
                      onTap: () {
                        setState(() {
                          currentIndex = currentIndex - 1;
                          _variableprogression = 0;
                        });

                        _controller.previousPage(
                            duration: Duration(milliseconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn);
                        _timer
                          ..reset()
                          ..start();
                      },
                      child: Container(
                        height: double.infinity,
                        width: screenSize.width * 0.5,
                        color: Colors.transparent,
                      ),
                    ),
                    GestureDetector(
                      onLongPress: statusPause,
                      onLongPressUp: statusResume,
                      onTap: () {
                        setState(() {
                          currentIndex = currentIndex + 1;
                          _variableprogression = 0;
                        });

                        _controller.nextPage(
                            duration: Duration(milliseconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn);
                        _timer
                          ..reset()
                          ..start();
                      },
                      child: Container(
                        width: screenSize.width * 0.5,
                        height: double.infinity,
                        color: Colors.transparent,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatusBar extends StatefulWidget {
  final Size screenSize;
  final int index;
  final double progressvalue;

  StatusBar({
    Key? key,
    required this.screenSize,
    required this.index,
    required this.progressvalue,
  }) : super(key: key);

  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      width: widget.screenSize.width * 0.16,
      height: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        child: LinearProgressIndicator(
          value: widget.progressvalue,
          valueColor: AlwaysStoppedAnimation<Color>(
            HexColor("#FFD900"),
          ),
          backgroundColor: Colors.white.withOpacity(0.82),
        ),
      ),
    );
  }
}

List<Widget> contents = [
  Container(
    color: Colors.black,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Text(
          "Ax² + Bx + C = 0",
          textAlign: TextAlign.left,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  ),
  Container(
    color: Colors.black,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.asset(
            "assets/images/coder.gif",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  ),
  Container(
    color: Colors.black,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.asset(
            "assets/images/steve.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  ),
  Container(
    color: Colors.green,
  ),
  Container(
    color: Colors.purple,
  ),
];
