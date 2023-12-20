import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/form/input_phonenumber.dart';
import 'package:LASYLAB/core/components/form/select_form_field.dart';
import 'package:LASYLAB/core/components/form/text_form_field.dart';
import 'package:LASYLAB/core/components/images.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/core/utils.dart';
import 'package:LASYLAB/feature/authentication/presentation/pages/choose_strong_topics.dart';
import 'package:LASYLAB/feature/formation/presentation/formation_screen.dart';
import 'package:LASYLAB/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  bool isChecked = false;
  late TextEditingController name;
  late TextEditingController surName;
  late TextEditingController phone;
  late TextEditingController school;
  late TextEditingController password;
  late TextEditingController birthdate;
  bool isloading = false;
  AnimationController? animationcontroller;
  late List<TextEditingController> fields;
  final formGlobalKey = GlobalKey<FormState>();
  AuthService auth = AuthService();
  List<String> classeitems = [
    /*  "SIL",
    "CP",
    "CE1",
    "CE2",
    "CM1",
    "CM2",*/
    "6e",
    "5e",
    "4e",
    "3e",
    "2nde",
    "1ère",
    "Tle"
  ];
  String selectedclassitem = "";

  List<String> schoolitems = [
    "C. S. AMASIA",
    "C. S. DE LA CITE",
    "C.E.T.G.U YAOUNDE",
    "C.S. ADVENTISTE",
    "C.S. AMIS DU PROGRES",
    "C.S. COMPL. MODERN. ESSOS",
    "C.S. DE L'ETHIQUE",
    "C.S. DE L'UNITE",
    "C.S. INSTITUT SIANTOU",
    "C.S. INSTITUT STAR YAOUNDE",
    "C.S. LA MATURITE",
    "C.S. LA PERSEVERANCE YAOUNDE",
    "C.S. LA RIGUEUR",
    "C.S. LA ROSIERE YAOUNDE",
    "C.S. LE PROGRES SOCIAL",
    "C.S. MARIE PERPETUEL SECOURS",
    "C.S. MATAMFEN",
    "C.S. NOTRE DAME DU ROSAIRE",
    "C.S. TELE AFRICA SCHOOL",
    "C.S. UNIVERSITAIRE NOVA VETERA",
    "CAMEROON SCHOOL OF EXCELLENCE",
    "CENTRE EDUCATIF EKOUDOU BASTOS",
    "CENTRE EDUCATIF MEYONG MEYEME",
    "CENTRE MERICI FRASSATI",
    "CETI JEANNE ALEGUE",
    "CETI SACRE COEUR MOKOLO",
    "CETIF BENIGNA ETOUDI",
    "CITY BILINGUAL ACADEMY",
    "COLLEGE ADVENTISTE YAOUNDE",
    "COLLEGE BILINGUE JEUNESSE LUMIERE",
    "COLLEGE BILINGUE KIATABALA",
    "COLLEGE CATHOLIQUE PERE MONTI",
    "COLLEGE DE LA MEFOU",
    "COLLEGE DE LA RENOVATION",
    "COLLEGE DE LA RETRAITE",
    "COLLEGE EBANDA",
    "COLLEGE FLEMING",
    "COLLEGE I.T.S.E",
    "COLLEGE JEAN TABI",
    "COLLEGE MADELEINE",
    "COLLEGE MARIE ALBERT II",
    "COLLEGE MONGO BETI",
    "COLLEGE P. L. MVOM-NNAM",
    "COLLEGE P. LAÏC EXCELLENCE PLUS",
    "COLLEGE PRIVE ATANGANA ESSOMBA",
    "COLLEGE PRIVE DE L'ESPERANCE",
    "COLLEGE PRIVE DU SAVOIR",
    "COLLEGE PRIVE LA GAITE",
    "COLLEGE PRIVE LAIC CHARLES MBAKOP",
    "COLLEGE PRIVE LAIC DU MONT VALERIEN",
    "COLLEGE PRIVE LAIC FAPO",
    "COLLEGE PRIVE LAIC LAROUSSE",
    "COLLEGE PRIVE LAIC LES PHARAONS",
    "COLLEGE PRIVE LAIC NOTRE DAME DES BEATITUDES",
    "COLLEGE PRIVE LAÏC DJA'ANKEU",
    "COLLEGE PRIVE LAÏC EFFA GASTON",
    "COLLEGE PRIVE LAÏC LES SAPINS",
    "COLLEGE PRIVE LAÏC SIGMUND FREUD",
    "COLLEGE PRIVE LES BAMBIS",
    "COLLEGE PRIVE LES LILAS",
    "COLLEGE PRIVE MONTESQUIEU",
    "COLLEGE PROTESTANT JOHNSTON",
    "COLLEGE SHAKESPEARE",
    "COLLEGE TOUSSAINT ANTOINE",
    "COLLEGE VOGT",
    "COMPLEXE SCOLAIRE ADVENTISTE D'ODZA",
    "COMPLEXE SCOLAIRE SAINT-ANDRE",
    "COURS DU SOIR DESCARTES",
    "COURS DU SOIR PROMETHE",
    "ECOLE D'AFRIQUE",
    "I.S.D.I.G YAOUNDE",
    "INSTITUT BAUDELAIRE BILINGUE",
    "INSTITUT BELLA ASSAN",
    "INSTITUT BILINGUE D'ETOUDI",
    "INSTITUT GASOLENT YAOUNDE",
    "INSTITUT JEAN BODY ZIBI",
    "INSTITUT MATAMFEN",
    "INSTITUT MBE",
    "INSTITUT POLYVALENT DE LA RENOVATION PEDAGOGIQUE",
    "INSTITUT POLYVALENT EXCELLENCE",
    "INSTITUT POLYVALENT NIBERT",
    "INSTITUT PRIVE LAÏC CENTRAL",
    "INSTITUT SAMBA",
    "INSTITUT SIANTOU",
    "INSTITUT TANA AHANDA",
    "INSTITUT TECHN. INDUS. ETOUG EBE",
    "INSTITUT VICTOR HUGO YAOUNDE",
    "IRG",
    "ISEIG YAOUNDE",
    "LYCEE BILINGUE D'APPLICATION YAOUNDE",
    "LYCEE BILINGUE D'ESSOS",
    "LYCEE BILINGUE D'ETOUG-EBE",
    "LYCEE D'ANGUISSA",
    "LYCEE D'EKOUNOU",
    "LYCEE D'ELIG-ESSONO",
    "LYCEE D'EMANA",
    "LYCEE DE BIYEM ASSI",
    "LYCEE DE LA CITE VERTE",
    "LYCEE DE MBALLA II",
    "LYCEE DE MENDONG",
    "LYCEE DE MIMBOMAN",
    "LYCEE DE NKOL-ETON",
    "LYCEE DE NKOLBISSON",
    "LYCEE DE NKOLNDONGO",
    "LYCEE DE NSAM EFOULAN",
    "LYCEE DE TSINGA",
    "LYCEE FRANCAIS Fustel de Coulanges",
    "LYCEE GENERAL LECLERC",
    "LYCEE NGOUSSO-NGOULMEKONG",
    "LYCEE TECHNIQUE D'EKOUNOU",
    "LYCEE TECHNIQUE DE NKOLBISSON",
    "LYCEE TECHNIQUE DE YAOUNDE",
    "Lycée Fustel de Coulanges",
    "NOTRE DAME DE VICTOIRE",
    "SEMINAIRE STE THERESE DE MVOLYE",
    "Autre"
  ];
  String selectedschoolitem = "";
  int step = 1;
  int studentClass = 0;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    surName = TextEditingController();
    phone = TextEditingController();
    school = TextEditingController();
    password = TextEditingController();
    birthdate = TextEditingController();
    if (mounted) {
      setState(() {
        selectedschoolitem = schoolitems[0];
        selectedclassitem = classeitems[0];
      });
    }
    fields = [
      name,
      surName,
      phone,
      password,
      birthdate,
    ];

    animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationcontroller!.dispose();
    phone.dispose();
    name.dispose();
    school.dispose();
    birthdate.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return HexColor("#AFAFAF");
    }

    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FCF6F4"),
        body: Form(
          key: formGlobalKey,
          child: ListView(
            primary: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * .05),
                      child: Column(
                        children: [
                          Visibility(
                              visible: step == 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8.0,
                                    ),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: BackButton(
                                        color: AppTheme.borderColor,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            bottom: 12,
                                          ),
                                          child: Container(
                                            height: 72,
                                            width: 141,
                                            child: Image.asset(
                                              "assets/images/splash.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: dimensH(
                                              screenSize.height * .02,
                                              sm: screenSize.height * .04),
                                        ),
                                        Center(
                                          child: Text(
                                            "Crée ton compte",
                                            style: TextStyle(
                                                fontSize: dimensH(
                                                  4 * SizeConfig.textMultiplier,
                                                  sm: 25,
                                                ),
                                                fontWeight: FontWeight.w700,
                                                color: AppTheme.textBlackColor),
                                          ),
                                        ),
                                        SizedBox(
                                          height: dimensH(
                                              screenSize.height * .01,
                                              sm: screenSize.height * .02),
                                        ),
                                        Text(
                                          "Si vous abonnez votre enfant,\nchoisissez le profil parent.",
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: dimensH(
                                                2.5 * SizeConfig.textMultiplier,
                                                sm: 18,
                                              ),
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff4B4B4B)),
                                        ),
                                        SizedBox(
                                          height: dimensH(
                                              screenSize.height * .05,
                                              sm: screenSize.height * .07),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: dimensW(
                                                  screenSize.width * .1,
                                                  sm: screenSize.width * .03)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        step = 2;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10, left: 5),
                                                      height: dimensH(
                                                          screenSize.height *
                                                              .12,
                                                          sm: screenSize
                                                                  .height *
                                                              .12),
                                                      width: dimensW(
                                                          screenSize.width *
                                                              .24,
                                                          sm: screenSize.width *
                                                              .24),
                                                      child: SvgPicture.asset(
                                                          Images
                                                              .eleveIllustration),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        border: Border.all(
                                                            width: 1,
                                                            style: BorderStyle
                                                                .solid,
                                                            color: AppTheme
                                                                .borderColor),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        screenSize.height * .01,
                                                  ),
                                                  Text("Eleve",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: dimensH(
                                                            2.3 *
                                                                SizeConfig
                                                                    .textMultiplier,
                                                            sm: 15,
                                                          ),
                                                          fontFamily: GoogleFonts
                                                                  .openSans()
                                                              .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: AppTheme
                                                              .textBlackColor))
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        step = 2;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10, left: 5),
                                                      height: dimensH(
                                                          screenSize.height *
                                                              .12,
                                                          sm: screenSize
                                                                  .height *
                                                              .12),
                                                      width: dimensW(
                                                          screenSize.width *
                                                              .24,
                                                          sm: screenSize.width *
                                                              .3),
                                                      child: SvgPicture.asset(
                                                          Images
                                                              .parentIllustration),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          border: Border.all(
                                                              width: 1,
                                                              style: BorderStyle
                                                                  .solid,
                                                              color: AppTheme
                                                                  .borderColor),
                                                          color: AppTheme
                                                              .whiteColor),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        screenSize.height * .01,
                                                  ),
                                                  Text("Parent",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: dimensH(
                                                            2.3 *
                                                                SizeConfig
                                                                    .textMultiplier,
                                                            sm: 15,
                                                          ),
                                                          fontFamily: GoogleFonts
                                                                  .openSans()
                                                              .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: AppTheme
                                                              .textBlackColor))
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                         Navigator.of(context).pushNamed(FormationScreen.routeName);
                                        },
                                        child: Image.asset(
                                            Images
                                                .formation, fit: BoxFit.contain,),
                                      ),
                                      SizedBox(
                                        height:
                                        screenSize.height * .01,
                                      ),
                                      Text("Formation",
                                          textAlign:
                                          TextAlign.center,
                                          style: TextStyle(
                                              fontSize: dimensH(
                                                2.3 *
                                                    SizeConfig
                                                        .textMultiplier,
                                                sm: 15,
                                              ),
                                              fontFamily: GoogleFonts
                                                  .openSans()
                                                  .fontFamily,
                                              fontWeight:
                                              FontWeight.w700,
                                              color: AppTheme
                                                  .textBlackColor))
                                    ],
                                  ),


                                  SizedBox(
                                    height: dimensH(screenSize.height * .13,
                                        sm: screenSize.height * .3),
                                  ),
                                ],
                              )),
                          Visibility(
                              visible: step == 2,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8.0,
                                    ),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: IconButton(
                                          iconSize: 24,
                                          color: AppTheme.borderColor,
                                          icon: Icon(Icons.arrow_back),
                                          onPressed: () {
                                            setState(() {
                                              step = 1;
                                            });
                                          },
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      bottom: 12,
                                    ),
                                    child: Container(
                                      height: dimensH(62, sm: 72),
                                      width: dimensW(131, sm: 141),
                                      child: Image.asset(
                                        "assets/images/splash.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Crée ton compte",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: dimensH(
                                        4 * SizeConfig.textMultiplier,
                                        sm: 25,
                                      ),
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.textBlackColor,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "En quelle classe es-tu\n[2021-2022]",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: dimensH(
                                          2.5 * SizeConfig.textMultiplier,
                                          sm: 18,
                                        ),
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff4B4B4B),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: dimensH(screenSize.height * .02,
                                        sm: screenSize.height * .02),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenSize.width * .01),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ...[6, 5, 4, 3]
                                              .map((e) => InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        studentClass = e;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: dimensH(
                                                        screenSize.height * .08,
                                                      ),
                                                      width: dimensW(
                                                          screenSize.width *
                                                              .15,
                                                          sm: screenSize.width *
                                                              .15),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: studentClass ==
                                                                  e
                                                              ? AppTheme
                                                                  .primaryLightColor
                                                              : AppTheme
                                                                  .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              width: 1,
                                                              style:
                                                                  BorderStyle
                                                                      .solid,
                                                              color: studentClass ==
                                                                      e
                                                                  ? AppTheme
                                                                      .secondaryColor
                                                                  : AppTheme
                                                                      .borderColor)),
                                                      child: Text(
                                                          e.toString() + "e",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: studentClass ==
                                                                      e
                                                                  ? AppTheme
                                                                      .secondaryColor
                                                                  : AppTheme
                                                                      .textBlackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: dimensH(
                                                                3 *
                                                                    SizeConfig
                                                                        .textMultiplier,
                                                                sm: 20,
                                                              ))),
                                                    ),
                                                  ))
                                              .toList(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: dimensH(screenSize.height * .02),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenSize.width * .206),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ...[1, 2]
                                              .map((e) => InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        studentClass = e;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: dimensH(
                                                        screenSize.height * .08,
                                                      ),
                                                      width: screenSize.width *
                                                          .15,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: studentClass ==
                                                                  e
                                                              ? AppTheme
                                                                  .primaryLightColor
                                                              : AppTheme
                                                                  .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              width: 1,
                                                              style:
                                                                  BorderStyle
                                                                      .solid,
                                                              color: studentClass ==
                                                                      e
                                                                  ? AppTheme
                                                                      .secondaryColor
                                                                  : AppTheme
                                                                      .borderColor)),
                                                      child: Text(
                                                          e == 1
                                                              ? e.toString() +
                                                                  "ère"
                                                              : e.toString() +
                                                                  "nde",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: studentClass ==
                                                                      e
                                                                  ? AppTheme
                                                                      .secondaryColor
                                                                  : AppTheme
                                                                      .textBlackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: dimensH(
                                                                3 *
                                                                    SizeConfig
                                                                        .textMultiplier,
                                                                sm: 20,
                                                              ))),
                                                    ),
                                                  ))
                                              .toList()
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: dimensH(screenSize.height * .02),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenSize.width * .05),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          studentClass = 7;
                                        });
                                      },
                                      child: Container(
                                        height:
                                            dimensH(screenSize.height * .08),
                                        width: dimensW(screenSize.width * .15),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: studentClass == 7
                                                ? AppTheme.primaryLightColor
                                                : AppTheme.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                style: BorderStyle.solid,
                                                color: studentClass == 7
                                                    ? AppTheme.secondaryColor
                                                    : AppTheme.borderColor)),
                                        child: Text("Tle",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: studentClass == 7
                                                    ? AppTheme.secondaryColor
                                                    : AppTheme.textBlackColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: dimensH(
                                                  3 * SizeConfig.textMultiplier,
                                                  sm: 20,
                                                ))),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: dimensH(screenSize.height * .02,
                                        sm: screenSize.height * .14),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 15,
                                      bottom: dimensH(20, sm: 30),
                                    ),
                                    child: SizedBox(
                                      height: dimensH(screenSize.height * .08),
                                      width: double.infinity,
                                      child: FancyButton(
                                        child: Center(
                                          child: Text(
                                            "Continuer",
                                            style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              textStyle: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        size: 18,
                                        color: HexColor("#58CC02"),
                                        onPressed: () {
                                          if (studentClass != 0)
                                            setState(() {
                                              step = 3;
                                            });
                                        },
                                        duration:
                                            const Duration(milliseconds: 160),
                                      ),
                                    ),
                                  ),
                                  /*SizedBox(
                                    height: screenSize.height * .05,
                                  ),*/
                                ],
                              )),
                          Visibility(
                            visible: step == 3,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8.0,
                                  ),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: IconButton(
                                        iconSize: 24,
                                        color: AppTheme.borderColor,
                                        icon: Icon(Icons.arrow_back),
                                        onPressed: () {
                                          setState(() {
                                            step = 2;
                                          });
                                        },
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                    bottom: 12,
                                  ),
                                  child: Container(
                                    height: 72,
                                    width: 141,
                                    child: Image.asset(
                                      "assets/images/splash.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Crée ton compte",
                                    style: GoogleFonts.nunito(
                                      color: Colors.black,
                                      textStyle: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: screenSize.width * 0.44,
                                          child: CustomTextFormField(
                                            label: "Nom",
                                            labelWidget: Container(),
                                            controller: name,
                                            validators: (value) {
                                              if (value!.isEmpty) {
                                                return "Entrer votre numéro de téléphone";
                                              } else if (value.trim().length <
                                                  9) {
                                                return "Numéro de télephone incorrect";
                                              } else {
                                                return null;
                                              }
                                            },
                                          )),
                                      SizedBox(
                                        width: screenSize.width * .05,
                                      ),
                                      SizedBox(
                                        width: screenSize.width * 0.44,
                                        child: CustomTextFormField(
                                          label: "Prénom",
                                          labelWidget: Container(),
                                          controller: surName,
                                          validators: (value) {
                                            if (value!.isEmpty) {
                                              return "Entrer votre prénom";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomTextFormField(
                                  label: "Téléphone",
                                  labelWidget: Container(),
                                  controller: phone,
                                  validators: (value) {
                                    if (value!.isEmpty) {
                                      return "Entrer votre numéro de téléphone";
                                    } else if (value.trim().length < 9) {
                                      return "Numéro de télephone incorrect";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  prefixText: '+237 ',
                                  inputFormatter: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                                selectedschoolitem == "Autre"
                                    ? CustomTextFormField(
                                        label: "Ecole",
                                        labelWidget: Container(),
                                        controller: school,
                                        validators: (value) {
                                          if (value!.isEmpty) {
                                            return "Entrer votre école";
                                          } else {
                                            return null;
                                          }
                                        },
                                      )
                                    : SelectFormField(
                                        label: "Ecole",
                                        value: selectedschoolitem,
                                        items: schoolitems
                                            .map((e) => DropdownMenuItem(
                                                child: Text(
                                                  e,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                value: e))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedschoolitem = value!;
                                            fields =
                                                selectedschoolitem != "Autre"
                                                    ? [
                                                        name,
                                                        surName,
                                                        phone,
                                                        password,
                                                        birthdate,
                                                      ]
                                                    : [
                                                        name,
                                                        surName,
                                                        phone,
                                                        school,
                                                        password,
                                                        birthdate,
                                                      ];
                                            Logger().d(fields.length);
                                          });
                                        },
                                      ),
                                CustomTextFormField(
                                  label: "Mot de passe",
                                  labelWidget: Container(),
                                  controller: password,
                                  validators: (value) {
                                    if (value!.isEmpty) {
                                      return "Entrer votre mot de passe";
                                    } else if (value.length < 8) {
                                      return "Le mot de passe doit avoir au moins 8 caractères";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: true,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    showCupertinoDatePicker(
                                        screenSize: screenSize,
                                        onDateTimeChanged: (value) {
                                          setState(() {
                                            birthdate.text =
                                                "${DateFormat('yyyy-MM-dd').format(value!)}";
                                          });
                                        });
                                  },
                                  child: Container(
                                    width: screenSize.width * 0.9,
                                    // height: 60,
                                    color: Colors.transparent,
                                    child: FittedBox(
                                      child: Center(
                                        child: SizedBox(
                                          width: screenSize.width * 0.9,
                                          child: IgnorePointer(
                                              child: CustomTextFormField(
                                            label: "Date de Naissance",
                                            labelWidget: Container(),
                                            controller: birthdate,
                                            validators: (value) {
                                              if (value!.isEmpty ||
                                                  birthdate.text.isEmpty) {
                                                return "Entrer votre date de naissance";
                                              } else {
                                                return null;
                                              }
                                            },
                                            suffixIcon: GestureDetector(
                                              onTap: () async {
                                                await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2010),
                                                  lastDate: DateTime(2025),
                                                ).then((value) {
                                                  setState(() {
                                                    birthdate.text =
                                                        "${DateFormat('yyyy-MM-dd').format(value!)}";
                                                  });
                                                });
                                              },
                                              child: Icon(
                                                Icons.date_range,
                                                color: AppTheme.primaryColor,
                                              ),
                                            ),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                        checkColor: AppTheme.primaryColor,
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                getColor),
                                        value: isChecked,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          "j’accepte de recevoir des conseils pédagogique et des offres promotionnelles de lasyalab sms.",
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          maxLines: 3,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 15,
                                    bottom: 30,
                                  ),
                                  child: SizedBox(
                                    height: screenSize.height * .06,
                                    width: double.infinity,
                                    child: FancyButton(
                                      child: isloading
                                          ? Center(
                                              child: SpinKitWave(
                                                color: Colors.white,
                                                size: 25,
                                                controller: animationcontroller,
                                              ),
                                            )
                                          : Center(
                                              child: Text(
                                                "Terminer",
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
                                      color: !isFilled(
                                          isSelectedschoolitem:
                                          selectedschoolitem !=
                                              "Autre")
                                          ? Colors.grey
                                          : HexColor("#58CC02"),
                                      onPressed:() {
                                        Navigator.of(context)
                                            .pushNamed(ChooseStrongTopics.routeName);
                                      },
                                      // : () async {
                                      //     if (formGlobalKey
                                      //         .currentState!
                                      //         .validate()) {
                                      //       //loader
                                      //       /*       bool register =await auth.signup(email, password);
                                      // if(register){
                                      //   Navigator.of(context)
                                      // .pushNamed("/welcome_fees");
                                      // }*/
                                      //       try {
                                      //         setState(() {
                                      //           isloading = true;
                                      //         });
                                      //         bool result =
                                      //             await DBService()
                                      //                 .verifyIfPhoneExist(
                                      //                     phone.text);
                                      //         setState(() {
                                      //           isloading = false;
                                      //         });
                                      //         Logger().d("result " +
                                      //             result.toString());
                                      //         if (result) {
                                      //           Fluttertoast.showToast(
                                      //               msg:
                                      //                   "Ce numéro de téléphone existe déjà",
                                      //               toastLength: Toast
                                      //                   .LENGTH_SHORT,
                                      //               gravity:
                                      //                   ToastGravity
                                      //                       .BOTTOM,
                                      //               timeInSecForIosWeb:
                                      //                   4,
                                      //               backgroundColor:
                                      //                   HexColor(
                                      //                       "#58CC02"),
                                      //               textColor:
                                      //                   Colors.white,
                                      //               fontSize: 16.0);
                                      //         } else {
                                      //           Navigator.of(context).push(
                                      //               MaterialPageRoute(
                                      //                   builder:
                                      //                       (context) =>
                                      //                           OTPScreen(
                                      //                             nom:
                                      //                                 name.text,
                                      //                             prenom:
                                      //                                 surName.text,
                                      //                             telephone:
                                      //                                 phone.text,
                                      //                             ecole: selectedschoolitem == "Autre"
                                      //                                 ? school.text
                                      //                                 : selectedschoolitem,
                                      //                             classe:
                                      //                                 selectedclassitem,
                                      //                             password:
                                      //                                 password.text,
                                      //                             birthdate:
                                      //                                 birthdate.text,
                                      //                           )));
                                      //         }
                                      //       } catch (e) {
                                      //         Logger().d(e);
                                      //         setState(() {
                                      //           isloading = false;
                                      //         });
                                      //         Fluttertoast.showToast(
                                      //             msg:
                                      //                 "Une erreur est survenue",
                                      //             toastLength: Toast
                                      //                 .LENGTH_SHORT,
                                      //             gravity:
                                      //                 ToastGravity
                                      //                     .BOTTOM,
                                      //             timeInSecForIosWeb:
                                      //                 4,
                                      //             backgroundColor:
                                      //                 HexColor(
                                      //                     "#58CC02"),
                                      //             textColor:
                                      //                 Colors.white,
                                      //             fontSize: 16.0);
                                      //       }
                                      //     }
                                      //   },
                                      duration:
                                          const Duration(milliseconds: 160),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: step != 3
                    ? dimensH(screenSize.height * .03,
                        sm: screenSize.height * .05)
                    : screenSize.height * .01,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    Visibility(
                      visible: step == 3,
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "En cliquant sur Terminer, vous acceptez les\nconditions générales d’utilisation et la politique de\nconfidentialité de lasylab",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                              color: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
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
                                  text: 'Connecte-toi!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).pushNamed("/login");
                                    }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showCupertinoDatePicker(
      {required Function onDateTimeChanged, required Size screenSize}) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: screenSize.height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                onDateTimeChanged(value);
              },
              initialDateTime: DateTime.now(),
              minimumYear: 1900,
              maximumYear: getCurrentYear(),
            ),
          );
        });
  }

  bool isFilled({bool isSelectedschoolitem = false}) {
    int check = 0;
    for (var field in fields) {
      if (field.text != "") check++;
    }
    return !isSelectedschoolitem ? check == 6 : check == 5;
  }
}
