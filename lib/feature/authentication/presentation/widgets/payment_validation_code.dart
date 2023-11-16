// import 'package:LASYLAB/core/components/styling.dart';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// Future<void> showPaymentValidationCode(
//         {required BuildContext ctx, required Size screeSize}) =>
//     showDialog(
//         context: ctx,
//         builder: (ctx) => Dialog(
//               insetPadding: EdgeInsets.zero,
//               backgroundColor: Colors.black.withOpacity(.5),
//               child: Container(
//                 height: screeSize.height * .3,
//                 width: screeSize.width * .8,
//                 padding: EdgeInsets.symmetric(
//                   vertical: screeSize.height * .05,
//                   horizontal: screeSize.width * .03,
//                 ),
//                 decoration: BoxDecoration(
//                   color: AppTheme.whiteColor,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Entrez votre code de paiment",
//                       textAlign: TextAlign.center,
//                       style:
//                           TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       height: screeSize.height * .06,
//                     ),
//                     //TODO add the opt form
//                     Container(
//                       child: PinCodeTextField(
//                         length: 3,
//                         obscureText: false,
//                         animationType: AnimationType.fade,
//                         pinTheme: PinTheme(
//                           shape: PinCodeFieldShape.box,
//                           borderRadius: BorderRadius.circular(5),
//                           fieldHeight: 50,
//                           fieldWidth: 40,
//                           activeFillColor: Colors.white,
//                         ),
//                         animationDuration: Duration(milliseconds: 300),
//                         backgroundColor: AppTheme.primaryColor,
//                         enableActiveFill: true,
//                         errorAnimationController: errorController,
//                         controller: textEditingController,
//                         onCompleted: (v) {
//                           print("Completed");
//                         },
//                         onChanged: (value) {
//                           print(value);
//                           setState(() {
//                             currentText = value;
//                           });
//                         },
//                         beforeTextPaste: (text) {
//                           print("Allowing to paste $text");
//                           //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//                           //but you can show anything you want here, like your pop up saying wrong paste format or etc
//                           return true;
//                         }, appContext: ctx,
//                       ),
//                     ),
//                     SizedBox(
//                       height: screeSize.height * .06,
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: AppTheme.secondaryColor,
//                         alignment: Alignment.center,
//                         elevation: 2,
//                         fixedSize: Size(screeSize.width * .4, 35),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(31),
//                         ),
//                       ),
//                       onPressed: () {
//                         // Navigator.pop(ctx);
//                       },
//                       child: Text(
//                         "ENVOYER",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ));
