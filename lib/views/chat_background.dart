import 'package:LASYLAB/components/fancy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatBackground extends StatefulWidget {
  const ChatBackground({Key? key}) : super(key: key);

  @override
  State<ChatBackground> createState() => _ChatBackgroundState();
}

class _ChatBackgroundState extends State<ChatBackground> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          statusBarColor: HexColor("#235390"),
          statusBarIconBrightness: Brightness.light),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor("#235390"),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: screenSize.height * 0.6,
              child: Image.asset(
                "assets/images/background_trapeze.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.10, //185,
            left: screenSize.width * 0.15, //60,
            //right: 60,
            child: SizedBox(
              width: screenSize.width * 0.65,
              height: screenSize.width * 0.65,
              child: Image.asset(
                "assets/images/chat_illustration.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "QUESTIONS REPONSES",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 40.0,
                      right: 40,
                      top: 8,
                      bottom: 10,
                    ),
                    child: Text(
                      "Trouves les reponses à toutes tes\nquestions quelque soit la matière ou la\ndifficultée",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 10,
                  ),
                  child: Container(
                    width: 30.0,
                    height: 10,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white.withOpacity(0.73),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 40.0,
                    right: 40,
                    top: 15,
                    bottom: 50,
                  ),
                  child: SizedBox(
                    height: screenSize.height * .06,
                    width: double.infinity,
                    child: FancyButton(
                      child: Center(
                        child: Text(
                          "Demarrer",
                          style: GoogleFonts.openSans(
                            color: HexColor("#1CB0F6"),
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      size: 18,
                      color: HexColor("#FFFFFF"),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/chat");
                      },
                      duration: const Duration(milliseconds: 160),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
