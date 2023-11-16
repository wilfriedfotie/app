import 'package:LASYLAB/components/fancy_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class QuizDialog extends StatelessWidget {
  const QuizDialog(
      {Key? key,
      this.height,
      this.backgroundcolor,
      this.foregroundcolor,
      this.texte,
      this.onpress})
      : super(key: key);
  final double? height;
  final Color? backgroundcolor;
  final Color? foregroundcolor;
  final String? texte;
  final Function()? onpress;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: height,
      color: backgroundcolor ?? HexColor("#FFDFE0"),
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenSize.height * .03,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                top: 10,
                bottom: 20,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$texte",
                  style: GoogleFonts.openSans(
                    color: foregroundcolor ?? HexColor("#FF4B4B"),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30,
                top: 10,
                bottom: 5,
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
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  size: 18,
                  color: foregroundcolor ?? HexColor("#FF4B4B"),
                  onPressed: onpress!,
                  duration: const Duration(milliseconds: 160),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
