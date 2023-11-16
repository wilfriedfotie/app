import 'dart:async';

import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class FeesFormula extends StatefulWidget {
  const FeesFormula({Key? key}) : super(key: key);

  @override
  _FeesFormulaState createState() => _FeesFormulaState();
}

class _FeesFormulaState extends State<FeesFormula> {
  late StreamController<ErrorAnimationType> errorController;
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  bool validateCode = false;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    textEditingController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: HexColor("#4B4B4B"),
            size: 40,
          ),
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
              value: 0.66,
              valueColor: AlwaysStoppedAnimation<Color>(
                HexColor("#58CC02"),
              ),
              backgroundColor: HexColor("#E5E5E5"),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
            top: dimensH(5, sm: 20), bottom: 20, left: 20, right: 20),
        children: [
          Text(
            "Choisis une formule",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: dimensH(3.1 * SizeConfig.textMultiplier, sm: 24),
                fontWeight: FontWeight.w700,
                color: AppTheme.textBlackColor),
          ),
          SizedBox(
            height: screenSize.height * .05,
          ),
          Text(
            "Recommandé pour vous",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: dimensH(2.1 * SizeConfig.textMultiplier, sm: 14),
                fontWeight: FontWeight.w700,
                color: AppTheme.errorColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Confort 6 mois",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize:
                          dimensH(3.1 * SizeConfig.textMultiplier, sm: 24),
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Essai gratuit 7 jours",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize:
                          dimensH(2.1 * SizeConfig.textMultiplier, sm: 14),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "30 000 F CFA/\n6 mois",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize:
                            dimensH(2.6 * SizeConfig.textMultiplier, sm: 18),
                        fontWeight: FontWeight.w700,
                        color: Color(0xff4B4B4B)),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              right: dimensH(150.0),
              top: 20.0,
              bottom: 10.0,
            ),
            child: SizedBox(
              height: dimensH(screenSize.height * .06),
              width: double.infinity,
              child: FancyButton(
                child: Center(
                  child: Text(
                    "Essayer gratuitement",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      textStyle: TextStyle(
                        fontSize:
                            dimensH(2.2 * SizeConfig.textMultiplier, sm: 16),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                size: 18,
                color: AppTheme.secondaryColor,
                onPressed: () {
                  showPaymentValidationCode(
                      screeSize: screenSize, ctx: context);
                },
                duration: const Duration(milliseconds: 160),
              ),
            ),
          ),
          SizedBox(
            height:
                dimensH(screenSize.height * .004, sm: screenSize.height * .03),
          ),
          Container(
            height: 1,
            color: AppTheme.borderColor,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Text(
              "Sans engagement",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: dimensH(2.1 * SizeConfig.textMultiplier, sm: 14),
                  fontWeight: FontWeight.w700,
                  color: Color(0xff4B4B4B)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Premium 1 mois",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize:
                          dimensH(3.1 * SizeConfig.textMultiplier, sm: 24),
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Essai gratuit 7 jours",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize:
                          dimensH(2.1 * SizeConfig.textMultiplier, sm: 14),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "6990 F CFA/\n6 mois",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize:
                            dimensH(2.6 * SizeConfig.textMultiplier, sm: 18),
                        fontWeight: FontWeight.w700,
                        color: Color(0xff4B4B4B)),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 150,
            ),
            child: SizedBox(
              height: dimensH(screenSize.height * .06),
              child: FancyButton(
                child: Center(
                  child: Text(
                    "Essayer gratuitement",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      textStyle: TextStyle(
                        fontSize:
                            dimensH(2.2 * SizeConfig.textMultiplier, sm: 16),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                size: 18,
                color: AppTheme.secondaryColor,
                onPressed: () {
                  Navigator.of(context).pushNamed("/menu");
                },
                duration: const Duration(milliseconds: 160),
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * .04,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Questions Fréquentes",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: dimensH(3.1 * SizeConfig.textMultiplier, sm: 24),
                  fontWeight: FontWeight.w700,
                  color: Color(0xff4B4B4B)),
            ),
          ),
          SizedBox(
            height:
                dimensH(screenSize.height * .07, sm: screenSize.height * .09),
          ),
          Text(
            "Pas maintanant, j’accepte uniquement aux 10 contenus gratuit",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: dimensH(2 * SizeConfig.textMultiplier, sm: 13),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showPaymentValidationCode(
          {required BuildContext ctx, required Size screeSize}) =>
      showDialog(
          context: ctx,
          builder: (ctx) => StatefulBuilder(
                builder: (ctx, optSetState) => Dialog(
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.black.withOpacity(.5),
                  child: Container(
                    height: screeSize.height * .3,
                    width: screeSize.width * .8,
                    padding: EdgeInsets.symmetric(
                      vertical: screeSize.height * .02,
                      horizontal: screeSize.width * .03,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screeSize.height * .02,
                        ),
                        Text(
                          "Entrez votre code de paiment",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: screeSize.height * .04,
                        ),
                        //TODO add the opt form
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: PinCodeTextField(
                            length: 3,
                            autoFocus: true,
                            autoDismissKeyboard: true,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 40,
                              fieldWidth: 50,
                              activeFillColor: AppTheme.primaryColor,
                              errorBorderColor: AppTheme.errorColor,
                              // inactiveColor: AppTheme.primaryColor,
                              inactiveFillColor: AppTheme.primaryColor,
                              activeColor: AppTheme.primaryColor,
                            ),
                            showCursor: true,
                            cursorColor: AppTheme.secondaryColor,
                            animationDuration: Duration(milliseconds: 300),
                            // backgroundColor: AppTheme.primaryColor,
                            enableActiveFill: false,
                            // errorAnimationController: errorController,
                            // controller: textEditingController,

                            onCompleted: (v) {
                              print("Completed");
                              print(v);
                              optSetState(() {
                                currentText = v;
                              });
                            },
                            onChanged: (value) {
                              print(value);
                              optSetState(() {
                                value.length == 3
                                    ? validateCode = true
                                    : validateCode = false;
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                            appContext: ctx,
                          ),
                        ),
                        SizedBox(
                          height: screeSize.height * .02,
                        ),
                        Visibility(
                          visible: validateCode,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppTheme.secondaryColor,
                              alignment: Alignment.center,
                              elevation: 2,
                              fixedSize: Size(screeSize.width * .4, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31),
                              ),
                            ),
                            onPressed: () {
                              // Navigator.pop(ctx);
                            },
                            child: Text(
                              "ENVOYER",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
}
