import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/form/text_form_field.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/feature/authentication/logic/bloc/user/user_bloc.dart';
import 'package:LASYLAB/views/menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late TextEditingController telephone;
  late TextEditingController password;
  final formGlobalKey = GlobalKey<FormState>();
  bool isloading = false;
  AnimationController? animationcontroller;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    telephone = TextEditingController();
    password = TextEditingController();
    animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    animationcontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserSuccess) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed("/menu");
        }

        if (state is UserFailed) {
          Navigator.of(context).pop();
        }
        if (state is UserLoading) {
          showDialog(
              context: context,
              builder: (_) => Dialog(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(40),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    ),
                  ));
        }
      },
      child: Scaffold(
        backgroundColor: HexColor("#FCF6F4"),
        body: Form(
          key: formGlobalKey,
          child: ListView(
            children: [
              SizedBox(
                height: screenSize.height * 0.82,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(26.0),
                      ),
                      side: BorderSide(
                          width: 1,
                          color: HexColor("#D2E4E8"),
                          style: BorderStyle.solid),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              top: 8.0,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: BackButton(
                                color: HexColor("#AFAFAF"),
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 25.0,
                                right: 25.0,
                              ),
                              child: Container(
                                height: screenSize.height * 0.036,
                                width: screenSize.width * 0.26,
                                child: Image.asset(
                                  "assets/images/splash.png",
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Connecte-toi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.textBlackColor),
                            ),
                          ),
                          SizedBox(
                            height: dimensH(screenSize.height * .05,
                                sm: screenSize.height * .15),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenSize.width * .1),
                            child: Column(
                              children: <Widget>[
                                CustomTextFormField(
                                  label: "Téléphone",
                                  labelWidget: Container(),
                                  controller: telephone,
                                  keyboardType: TextInputType.number,
                                  inputFormatter: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validators: (value) {
                                    if (value!.isEmpty) {
                                      return "Entrer votre numéro de téléphone";
                                    } else if (value.trim().length < 9) {
                                      return "Numéro de télephone incorrect";
                                    } else {
                                      return null;
                                    }
                                  },
                                  prefixText: "+237",
                                ),
                                CustomTextFormField(
                                  label: "Mot de passe",
                                  labelWidget: InkWell(
                                    splashColor: AppTheme.primaryLightColor,
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed("/congratulations");
                                    },
                                    child: Text(
                                      "je l’ai oublié 😅",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.textBlackColor,
                                      ),
                                    ),
                                  ),
                                  isLabelWidget: true,
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
                                Container(
                                  child: SizedBox(
                                    height: 45,
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
                                                "Je me connecte",
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
                                        context
                                            .read<UserBloc>()
                                            .add(FectUserData());
                                      },
                                      // : () async {
                                      //     if (formGlobalKey.currentState!
                                      //         .validate()) {
                                      //       try {
                                      //         setState(() {
                                      //           isloading = true;
                                      //         });
                                      //         // if (FirebaseAuth.instance
                                      //         //         .currentUser !=
                                      //         //     null) {
                                      //         //   Logger().d(FirebaseAuth
                                      //         //       .instance
                                      //         //       .currentUser);
                                      //         //   Usermodel? user =
                                      //         //       await DBService()
                                      //         //           .getUser(FirebaseAuth
                                      //         //               .instance
                                      //         //               .currentUser!
                                      //         //               .uid);
                                      //         //   Logger()
                                      //         //       .d(user!.toJson());
                                      //         //   setState(() {
                                      //         //     isloading = false;
                                      //         //   });
                                      //         //   if (user.password ==
                                      //         //           password.text &&
                                      //         //       user.telephone ==
                                      //         //           telephone.text) {
                                      //         //     Fluttertoast.showToast(
                                      //         //         msg:
                                      //         //             "Connecté avec succès",
                                      //         //         toastLength: Toast
                                      //         //             .LENGTH_SHORT,
                                      //         //         gravity:
                                      //         //             ToastGravity
                                      //         //                 .BOTTOM,
                                      //         //         timeInSecForIosWeb:
                                      //         //             4,
                                      //         //         backgroundColor:
                                      //         //             HexColor(
                                      //         //                 "#58CC02"),
                                      //         //         textColor:
                                      //         //             Colors.white,
                                      //         //         fontSize: 16.0);
                                      //         //
                                      //         //     Navigator.of(context)
                                      //         //         .pushNamed(
                                      //         //             "/account_choice");
                                      //         //   } else {
                                      //         //     Fluttertoast.showToast(
                                      //         //         msg:
                                      //         //             "Téléphone ou Mot de passe incorrect",
                                      //         //         toastLength: Toast
                                      //         //             .LENGTH_SHORT,
                                      //         //         gravity:
                                      //         //             ToastGravity
                                      //         //                 .BOTTOM,
                                      //         //         timeInSecForIosWeb:
                                      //         //             4,
                                      //         //         backgroundColor:
                                      //         //             HexColor(
                                      //         //                 "#58CC02"),
                                      //         //         textColor:
                                      //         //             Colors.white,
                                      //         //         fontSize: 16.0);
                                      //         //   }
                                      //         // } else {
                                      //         //   Logger().d(
                                      //         //       "Login with Firestore");
                                      //         //   Usermodel? user =
                                      //         //       await DBService()
                                      //         //           .loginWithFirestore(
                                      //         //               telephone
                                      //         //                   .text,
                                      //         //               password
                                      //         //                   .text);
                                      //         //
                                      //         //   if (user != null) {
                                      //         //     Fluttertoast.showToast(
                                      //         //         msg:
                                      //         //             "Connecté avec succès",
                                      //         //         toastLength: Toast
                                      //         //             .LENGTH_SHORT,
                                      //         //         gravity:
                                      //         //             ToastGravity
                                      //         //                 .BOTTOM,
                                      //         //         timeInSecForIosWeb:
                                      //         //             4,
                                      //         //         backgroundColor:
                                      //         //             HexColor(
                                      //         //                 "#58CC02"),
                                      //         //         textColor:
                                      //         //             Colors.white,
                                      //         //         fontSize: 16.0);
                                      //         //
                                      //         //     Navigator.of(context)
                                      //         //         .pushNamed(
                                      //         //             "/account_choice");
                                      //         //   } else {
                                      //         //     Fluttertoast.showToast(
                                      //         //         msg:
                                      //         //             "Téléphone ou Mot de passe incorrect",
                                      //         //         toastLength: Toast
                                      //         //             .LENGTH_SHORT,
                                      //         //         gravity:
                                      //         //             ToastGravity
                                      //         //                 .BOTTOM,
                                      //         //         timeInSecForIosWeb:
                                      //         //             4,
                                      //         //         backgroundColor:
                                      //         //             HexColor(
                                      //         //                 "#58CC02"),
                                      //         //         textColor:
                                      //         //             Colors.white,
                                      //         //         fontSize: 16.0);
                                      //         //   }
                                      //         //
                                      //         //   setState(() {
                                      //         //     isloading = false;
                                      //         //   });
                                      //         // }
                                      //       } catch (e) {
                                      //         Logger().d(e);
                                      //         setState(() {
                                      //           isloading = false;
                                      //         });
                                      //         Fluttertoast.showToast(
                                      //             msg:
                                      //                 "Une erreur est survenue",
                                      //             toastLength:
                                      //                 Toast.LENGTH_SHORT,
                                      //             gravity:
                                      //                 ToastGravity.BOTTOM,
                                      //             timeInSecForIosWeb: 4,
                                      //             backgroundColor:
                                      //                 HexColor("#58CC02"),
                                      //             textColor: Colors.white,
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
                          ),
                        ],
                      ),
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
                          text: 'inscris-toi ici !',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed("/register");
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
