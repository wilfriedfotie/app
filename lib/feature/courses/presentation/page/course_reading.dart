import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseReading extends StatefulWidget {
  const CourseReading({Key? key}) : super(key: key);

  @override
  _CourseReadingState createState() => _CourseReadingState();
}

class _CourseReadingState extends State<CourseReading> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
        centerTitle: true,
        title: Text(
          "Introduction",
          style: TextStyle(
              fontFamily: GoogleFonts.openSans().fontFamily,
              color: AppTheme.textBlackColor,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: screenSize.height * .8,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(horizontal: screenSize.width * .045),
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * .05,
                vertical: screenSize.height * .02),
            decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(21)),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: "Etapes à suivre pour factoriser un polynôme",
                    style: TextStyle(color: AppTheme.blueColor, fontSize: 18),
                  ),
                ),
                SizedBox(height: 42.0),

                Text(
                  'Étapes à suivre pour factoriser un polynôme :',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  'Cas : binôme',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Lorsque l\'expression à factoriser est un binôme, voici les étapes recommandées :',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  '1. Effectuer une mise en évidence simple, si c\'est possible.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  '2. Si le signe entre les deux termes du binôme est une soustraction, vérifier s\'il est possible de faire une différence de carrés.',
                  style: TextStyle(fontSize: 16.0),
                ),
                // Ajoutez d'autre
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: screenSize.width * .15,
            child: Container(
              height: screenSize.height * .07,
              width: screenSize.width * .7,
              child: FancyButton(
                child: Center(
                  child: Text(
                    "Passez le quiz",
                    style: GoogleFonts.openSans(
                      color: AppTheme.whiteColor,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                size: 18,
                color: AppTheme.primaryColor,
                onPressed: () {
                  Navigator.of(context).pushNamed("/quiz_launcher");
                },
                duration: const Duration(milliseconds: 160),
              ),
            ),
          )
        ],
      ),
    );
  }
}
