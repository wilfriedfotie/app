import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class WelcomeFees extends StatefulWidget {
  const WelcomeFees({Key? key}) : super(key: key);

  @override
  _WelcomeFeesState createState() => _WelcomeFeesState();
}

class _WelcomeFeesState extends State<WelcomeFees> {
  final packItems = [
    "Fiche de cours, méthodes",
    "quiz",
    "cours vidéo explicatif",
    "Télécharge tes cours",
    "chat avec un prof",
    "Epreuves corrigées",
    "Emplois de temps",
    "Apprentissage"
  ];
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarColor: Colors.white, //HexColor("#FCF6F4"),
        statusBarIconBrightness: Brightness.dark, // status bar color
      ),
    );
    super.initState();
  }

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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, color: HexColor("#AFAFAF"), size: 40),
          ),
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: screenSize.width * 0.9,
            height: 9,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: LinearProgressIndicator(
                value: 0.33,
                valueColor: AlwaysStoppedAnimation<Color>(
                  HexColor("#58CC02"),
                ),
                backgroundColor: HexColor("#E5E5E5"),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
          child: ListView(
            children: [
              Text(
                "Bienvenue",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: dimensH(4 * SizeConfig.textMultiplier, sm: 24),
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textBlackColor),
              ),
              SizedBox(
                height: dimensH(4, sm: screenSize.height * .02),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 15,
                  right: 15,
                ),
                child: Text(
                  "Essai gratuitement tous nos\nservice pendant 7 jours.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: dimensH(3 * SizeConfig.textMultiplier, sm: 20),
                      fontWeight: FontWeight.w700,
                      color: Color(0xff4B4B4B)),
                ),
              ),
              SizedBox(
                height: dimensH(screenSize.height * .02,
                    sm: screenSize.height * .04),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * .13),
                child: Column(
                  children: [
                    Container(
                      height: dimensH(screenSize.height * .1,
                          sm: screenSize.height * .12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryLightColor.withOpacity(.7),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        border: Border.all(
                            width: 3,
                            style: BorderStyle.solid,
                            color: AppTheme.secondaryColor),
                      ),
                      child: Text("Offre premium",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: dimensH(
                                  3.75 * SizeConfig.textMultiplier,
                                  sm: 24),
                              color: AppTheme.secondaryColor)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppTheme.whiteColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          border: Border.all(
                              width: 2,
                              style: BorderStyle.solid,
                              color: AppTheme.borderColor.withOpacity(.5))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: dimensH(screenSize.height * .01,
                                sm: screenSize.height * .03),
                          ),
                          Text(
                            "6990 FCFA/mois",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: dimensH(
                                  3.75 * SizeConfig.textMultiplier,
                                  sm: 24),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: dimensH(screenSize.height * .01,
                                sm: screenSize.height * .03),
                          ),
                          ...packItems
                              .map((e) => Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenSize.width * .07),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppTheme.blackColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(e.toString(),
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Color(0xff4B4B4B),
                                                  fontSize: dimensH(
                                                      2 *
                                                          SizeConfig
                                                              .textMultiplier,
                                                      sm: 13),
                                                  fontWeight: FontWeight.w700)),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              top: 20.0,
                              bottom: 10.0,
                            ),
                            child: SizedBox(
                              height: screenSize.height * .06,
                              width: double.infinity,
                              child: FancyButton(
                                child: Center(
                                  child: Text(
                                    "Essayer gratuitement",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.openSans().fontFamily),
                                  ),
                                ),
                                size: 18,
                                color: AppTheme.secondaryColor,
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed("/fees_formula");
                                },
                                duration: const Duration(milliseconds: 160),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: dimensH(screenSize.height * .01,
                          sm: screenSize.height * .03),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Pas maintanant, j’accepte uniquement aux 10 contenus gratuit",
                          softWrap: true,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: dimensH(2 * SizeConfig.textMultiplier,
                                  sm: 13)),
                        ))
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
