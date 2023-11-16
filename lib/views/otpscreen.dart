import 'package:LASYLAB/models/user.dart';
import 'package:LASYLAB/services/auth_service.dart';
import 'package:LASYLAB/services/database_service.dart';
import 'package:LASYLAB/views/fees_welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen(
      {Key? key,
      this.telephone,
      this.nom,
      this.prenom,
      this.ecole,
      this.classe,
      this.password,
      this.birthdate})
      : super(key: key);
  final String? telephone;
  final String? nom;
  final String? prenom;
  final String? ecole;
  final String? classe;
  final String? password;
  final String? birthdate;
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with TickerProviderStateMixin {
  final formGlobalKey = GlobalKey<FormState>();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  void _showSnackBar(String pin) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  AuthService authservice = AuthService();
  String? verificationCode;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  bool isloading = false;
  AnimationController? animationcontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyPhoneNumber();
    animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationcontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor("#FCF6F4"),
      body: Form(
        key: formGlobalKey,
        child: ListView(primary: true, children: [
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 12,
                          top: 15,
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
                          "OTP Verification",
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            "Téléphone : +237" + widget.telephone!,
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: isloading
                            ? Center(
                                child: SpinKitWave(
                                  color: HexColor("#58CC02"),
                                  size: 25,
                                  controller: animationcontroller,
                                ),
                              )
                            : Pinput(length: 6,

                                focusNode: _pinPutFocusNode,
                                controller: _pinPutController,
                                pinAnimationType: PinAnimationType.fade,
                                onSubmitted: (String pin) async {
                                  try {
                                    setState(() {
                                      isloading = true;
                                    });
                                    await FirebaseAuth.instance
                                        .signInWithCredential(
                                            PhoneAuthProvider.credential(
                                                verificationId:
                                                    verificationCode!,
                                                smsCode: pin))
                                        .then((value) async {
                                      if (value.user != null) {
                                        Logger().d('pass to home');

                                        await DBService().saveUser(Usermodel(
                                            id: value.user!.uid,
                                            nom: widget.nom,
                                            prenom: widget.prenom,
                                            telephone: widget.telephone,
                                            ecole: widget.ecole,
                                            classe: widget.classe,
                                            password: widget.password,
                                            dateNaiss: DateFormat('yyyy-MM-dd')
                                                .parse(widget.birthdate!)));
                                        setState(() {
                                          isloading = false;
                                        });
                                        Fluttertoast.showToast(
                                            msg: "Compte crée avec succès",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 4,
                                            backgroundColor:
                                                HexColor("#58CC02"),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WelcomeFees()),
                                            (route) => false);
                                      }
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      Logger().d(
                                          'The password provided is too weak.');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      Logger().d(
                                          'The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    setState(() {
                                      isloading = false;
                                    });
                                    FocusScope.of(context).unfocus();
                                    Fluttertoast.showToast(
                                        msg: "Code OTP invalide",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 4,
                                        backgroundColor: HexColor("#58CC02"),
                                        textColor: Colors.white,
                                        fontSize: 16.0);

                                    /*   scaffoldkey.currentState!.showSnackBar(
                                        SnackBar(content: Text("invalid OTP")));*/
                                  }
                                },
                              ),
                      ),
                      FittedBox(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                                width: screenSize.width * 0.9,
                                height: 40,
                                child: Text("")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ]),
      ),
    ));
  }

  verifyPhoneNumber() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "+237${widget.telephone}",
          verificationCompleted: (PhoneAuthCredential credential) async {
            //quand tout c'est bien passé
            Logger().d("on complete method");
            try {
              await FirebaseAuth.instance
                  .signInWithCredential(credential)
                  .then((value) async {
                if (value.user != null) {
                  Logger().d("user logged in");
                  print('save user');
                }
              });
            } catch (e) {
              Logger().d(e);
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            Logger().d(e.message);
            if (e.code == 'invalid-phone-number') {
              Logger().d('The provided phone number is not valid.');
              Fluttertoast.showToast(
                  msg: "Numéro de téléphone invalide",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 4,
                  backgroundColor: HexColor("#58CC02"),
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          codeSent: (String verificationID, int? resendToken) {
            if (mounted) {
              setState(() {
                verificationCode = verificationID;
              });
            }
          },
          codeAutoRetrievalTimeout: (String verificationID) {
            if (mounted) {
              setState(() {
                verificationCode = verificationID;
              });
            }
          },
          timeout: Duration(seconds: 60));
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Une erreur est survenue",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 4,
          backgroundColor: HexColor("#58CC02"),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
