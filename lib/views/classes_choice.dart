import 'package:LASYLAB/components/classes_card.dart';
import 'package:LASYLAB/components/fancy_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ClassesChoice extends StatefulWidget {
  const ClassesChoice({Key? key}) : super(key: key);

  @override
  State<ClassesChoice> createState() => _ClassesChoiceState();
}

class _ClassesChoiceState extends State<ClassesChoice> {
  List<bool> classes = List<bool>.filled(7, false);
  bool isSelected = false;

  bool isSelectedClass(int index) {
    for (var i = 0; i < classes.length; i++) {
      setState(() {
        if (i != index) {
          classes[i] = false;
        } else {
          classes[i] = true;
        }
      });
    }
    return (index >= 0 && index < 7);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FCF6F4"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              side: BorderSide(
                width: 1,
                color: HexColor("#D2E4E8"),
              ),
            ),
            child: Center(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: BackButton(
                        color: HexColor("#AFAFAF"),
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        right: 25.0,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: screenSize.height * 0.035,
                          width: screenSize.width * 0.25,
                          child: Image.asset(
                            "assets/images/splash.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Crée ton compte",
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "En quelle classe es tu en cette année\n[2021-2022] ?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = isSelectedClass(0);
                            });
                          },
                          child: ClassesCard(
                            classeName: "6e",
                            isSelected: classes[0],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = isSelectedClass(1);
                            });
                          },
                          child: ClassesCard(
                            classeName: "5e",
                            isSelected: classes[1],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = isSelectedClass(2);
                            });
                          },
                          child: ClassesCard(
                            classeName: "4e",
                            isSelected: classes[2],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = isSelectedClass(3);
                            });
                          },
                          child: ClassesCard(
                            classeName: "3e",
                            isSelected: classes[3],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 60.0,
                      right: 60,
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = isSelectedClass(4);
                            });
                          },
                          child: ClassesCard(
                            classeName: "2nde",
                            isSelected: classes[4],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = isSelectedClass(5);
                            });
                          },
                          child: ClassesCard(
                            classeName: "1ère",
                            isSelected: classes[5],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 5,
                      bottom: 5,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = isSelectedClass(6);
                        });
                      },
                      child: Center(
                        child: ClassesCard(
                          classeName: "Tle",
                          isSelected: classes[6],
                        ),
                      ),
                    ),
                  ),
                  isSelected
                      ? Container(
                          margin: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            top: 30.0,
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
                                Navigator.of(context)
                                    .pushNamed("/fees_formula"); // "/register"
                              },
                              duration: const Duration(milliseconds: 160),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          height: 20.0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 5,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                  text: 'Tu as déjà un compte ? ',
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'inscris-toi ici !',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed("/register");
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
