import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/gap.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/components/form/text_form_field.dart';
import '../core/components/images.dart';
import '../feature/courses/presentation/page/home.dart';

class WelcomeFees extends StatefulWidget {
  const WelcomeFees({Key? key}) : super(key: key);

  @override
  _WelcomeFeesState createState() => _WelcomeFeesState();
}

class _WelcomeFeesState extends State<WelcomeFees> {
  final packItems = [
    'Fiches de cours',
    'Méthodes quiz',
    'Cours vidéo explicatifs',
    'Télécharge tes cours',
    'Chat avec un prof',
    'Epreuves corrigées',
    'Emplois de temps apprentissage',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(),
          child: Column(
            children: [
              Container(
                height: dimensH(screenSize.height * .1,
                    sm: screenSize.height * .12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.secondaryLightBg.withOpacity(.3),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  border: Border.all(
                      width: 3,
                      style: BorderStyle.solid,
                      color: AppTheme.blueColor),
                ),
                child: Text("Offre premium",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize:
                            dimensH(3.75 * SizeConfig.textMultiplier, sm: 24),
                        color: AppTheme.blueColor)),
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
                      "10 000 FCFA/mois",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:
                            dimensH(3.75 * SizeConfig.textMultiplier, sm: 24),
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
                                      borderRadius: BorderRadius.circular(50),
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
                                                2 * SizeConfig.textMultiplier,
                                                sm: 13),
                                            fontWeight: FontWeight.w700)),
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                    gapH18,
                    FancyButton(
                      horzPadding: 40,
                      color: AppTheme.blueColor,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => Dialog(
                                  child: PayementModal(),
                                ));
                      },
                      child: Center(
                        child: Text(
                          "Payes la totalité",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: GoogleFonts.openSans().fontFamily),
                        ),
                      ),
                    ),
                    gapH14,
                    FancyButton(
                      horzPadding: 40,
                      child: Center(
                        child: Text(
                          "Fais une avance",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: GoogleFonts.openSans().fontFamily),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => Dialog(
                                  child: PayementModal(),
                                ));
                      },
                    ),
                    gapH14
                  ],
                ),
              ),
              SizedBox(
                height: dimensH(screenSize.height * .01,
                    sm: screenSize.height * .03),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  },
                  child: Text(
                    "Essaye lasylab",
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: AppTheme.blueColor,
                        fontWeight: FontWeight.w700,
                        fontSize:
                            dimensH(2 * SizeConfig.textMultiplier, sm: 13)),
                  ))
            ],
          ),
        )
      ],
    );
  }
}

class PayementModal extends StatelessWidget {
  const PayementModal({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(34.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Entre ton numéro de téléphone",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
            ),
            CustomTextFormField(
              obscureText: false,
              label: '',
              controller: null,
              labelWidget: SizedBox(),
            ),
            Row(children: [

              Image.asset(Images.momo),
              Spacer(),
              Image.asset(Images.orangeMomney)
            ],)
          ],
        ),
      ),
    );
  }
}
