import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/feature/courses/presentation/page/quiz_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CourseReader extends StatefulWidget {
  const CourseReader({Key? key}) : super(key: key);

  @override
  _CourseReaderState createState() => _CourseReaderState();
}

class _CourseReaderState extends State<CourseReader> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Equation et inéquation",
            textAlign: TextAlign.left,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: ListView(
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
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
            left: 40,
            right: 40,
          ),
          child: SizedBox(
            height: screenSize.height * .06,
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizLauncher(),
                  ),
                );
              },
              duration: const Duration(milliseconds: 160),
            ),
          ),
        ),
      ),
    );
  }
}
