import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/views/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class PreInscription extends StatelessWidget {
  static const routeName = "/preInscription";
  const PreInscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor("#FCF6F4"),
      body: ListView(
        children: [
          SizedBox(
            height: dimensH(screenSize.height * 0.8,
                sm: screenSize.height * 0.85),
            child: Padding(
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
                color: Colors.white,
                child: Column(
                  children: [
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: screenSize.height * 0.08,
                          width: screenSize.width * 0.45,
                          child: Image.asset(
                            "assets/images/splash.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * .03,
                    ),
                    FittedBox(
                      child: SvgPicture.asset(
                        "assets/svg/sit_reading.svg",
                        height: dimensH(screenSize.height * 0.15,
                            sm: screenSize.height * 0.2),
                        width: screenSize.width * 0.8,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * .05,
                    ),
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Réussis ton année !",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            textStyle: TextStyle(
                              fontSize: dimensH(
                                2.5 * SizeConfig.textMultiplier,
                                sm: 25,
                              ),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: dimensH(screenSize.height * .01,
                          sm: screenSize.height * .05),
                    ),
                    FittedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * .27),
                        child: Text(
                          "Fais partie de ceux qui\n reussissent",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            color: Color(0xffAFAFAF),
                            textStyle: TextStyle(
                              fontSize: dimensH(
                                2 * SizeConfig.textMultiplier,
                                sm: 22,
                              ),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: dimensH(screenSize.height * .01,
                          sm: screenSize.height * .03),
                    ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        top: 25,
                      ),
                      child: SizedBox(
                        height: dimensH(screenSize.height * .08,
                            sm: screenSize.height * .06),
                        width: double.infinity,
                        child: FancyButton(
                          child: Center(
                            child: Text(
                              "je m'inscris",
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
                          color: AppTheme.primaryColor,
                          onPressed: () {
                            Navigator.of(context).pushNamed("/register");
                          },
                          duration: const Duration(milliseconds: 160),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {},
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
                        text: 'Connecte-toi!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed(LoginPage.routeName);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
