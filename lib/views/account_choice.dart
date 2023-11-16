import 'package:LASYLAB/components/account_choice_card.dart';
import 'package:LASYLAB/components/fancy_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AccountChoicePage extends StatefulWidget {
  const AccountChoicePage({Key? key}) : super(key: key);

  @override
  State<AccountChoicePage> createState() => _AccountChoicePageState();
}

class _AccountChoicePageState extends State<AccountChoicePage> {
  bool isSelectedParent = false;
  bool isSelectedStudent = false;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: HexColor("#FCF6F4"),
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FCF6F4"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: screenSize.height * 0.85,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
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
                    ),
                    FittedBox(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Si vous abonnez votre enfant,\nchoisissez le profil.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedStudent = !isSelectedStudent;
                                    isSelectedParent = !isSelectedStudent;
                                  });
                                },
                                child: SizedBox(
                                  height: screenSize.height * 0.16,
                                  width: screenSize.width * 0.35,
                                  child: isSelectedStudent
                                      ? AccountChoiceCard(
                                          illustration:
                                              "assets/svg/children_choice.svg",
                                          isSelected: true,
                                        )
                                      : AccountChoiceCard(
                                          illustration:
                                              "assets/svg/children_choice.svg",
                                        ),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  "Elève",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedParent = !isSelectedParent;
                                    isSelectedStudent = !isSelectedParent;
                                  });
                                },
                                child: SizedBox(
                                  height: screenSize.height * 0.16,
                                  width: screenSize.width * 0.35,
                                  child: isSelectedParent
                                      ? AccountChoiceCard(
                                          illustration:
                                              "assets/svg/parent_choice.svg",
                                          isSelected: true,
                                        )
                                      : AccountChoiceCard(
                                          illustration:
                                              "assets/svg/parent_choice.svg",
                                        ),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  "Parent",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isSelectedStudent || isSelectedParent
                        ? Container(
                            margin: const EdgeInsets.only(
                              left: 20.0,
                              right: 20,
                              top: 50,
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
                                      .pushNamed("/classes_choice");
                                },
                                duration: const Duration(milliseconds: 160),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          height: 25.0,
          child: Padding(
            padding: const EdgeInsets.only(
              //left: 20.0,
              //right: 20.0,
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
