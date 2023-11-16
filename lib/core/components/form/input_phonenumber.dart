import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../size_config.dart';
import '../styling.dart';
import 'input_phone_widget.dart' as phone;

class InputPhoneNumberFormField extends StatefulWidget {
  final String? label;
  final TextEditingController controller;
  final Color? bgColor;
  final FocusNode? focusNode;
  InputPhoneNumberFormField(
      {Key? key,
      required this.label,
      required this.controller,
      this.bgColor,
      this.focusNode})
      : super(key: key);

  @override
  _InputPhoneNumberFormFieldState createState() =>
      _InputPhoneNumberFormFieldState();
}

class _InputPhoneNumberFormFieldState extends State<InputPhoneNumberFormField> {
  String initialCountry = 'CM';
  PhoneNumber number = PhoneNumber(isoCode: 'CM');

  var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(5),
        topRight: Radius.circular(5),
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      ),
      borderSide: BorderSide(width: 1, color: Colors.transparent));
  var border = OutlineInputBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(5),
        topRight: Radius.circular(5),
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      ),
      borderSide: BorderSide(width: 1, color: AppTheme.primaryColor));
  var focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
      borderSide: BorderSide(width: 1, color: Colors.transparent));
  var errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
      borderSide: BorderSide(width: 1, color: AppTheme.errorColor));

  var selectEnabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(width: 1, color: AppTheme.grayColor));
  var selectBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(width: 1, color: AppTheme.primaryColor));
  var selectFocusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(width: 1, color: AppTheme.primaryColor));
  var selectErrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(width: 1, color: AppTheme.errorColor));
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          widget.label ?? "",
          style: TextStyle(
              fontFamily: GoogleFonts.openSans().fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppTheme.grayColor),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: screenSize.height * .01,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: dimensW(screenSize.width * .05)),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: widget.bgColor ?? Colors.transparent,
            border: Border.all(
                width: 1,
                color: AppTheme.borderColor,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20),
          ),
          child: phone.InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },
            onInputValidated: (bool value) {
              print(value);
            },
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            // searchBoxDecoration: InputDecoration(
            //   focusedErrorBorder: selectErrorBorder,
            //   errorBorder: selectErrorBorder,
            //   enabledBorder: selectEnabledBorder,
            //   focusedBorder: selectFocusedBorder,
            //   disabledBorder: selectEnabledBorder,
            //   errorStyle: TextStyle(height: 0, color: Colors.white),
            //   errorText: "",
            // ),
            ignoreBlank: true,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            selectorTextStyle: TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: widget.controller,
            formatInput: false,
            keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
            inputBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: AppTheme.secondaryColor,
                )),
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
            },
            cursorColor: AppTheme.primaryColor,
            inputDecoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: dimensH(screenSize.height * .005),
                  horizontal: dimensW(screenSize.width * .05)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  borderSide: BorderSide(
                    width: 0,
                    color: AppTheme.secondaryColor,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  borderSide: BorderSide(
                    width: 0,
                    color: AppTheme.errorColor,
                  )),
              hintStyle: TextStyle(fontSize: 16),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
