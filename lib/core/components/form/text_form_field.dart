import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../size_config.dart';
import '../images.dart';
import '../styling.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final String? prefixText;
  final bool obscureText;
  final String? Function(String?)? validators;
  final TextInputType? keyboardType;
  final Widget labelWidget;
  final bool? isLabelWidget;
  final Widget? suffixIcon;
  const CustomTextFormField(
      {Key? key,
      required this.label,
      required this.controller,
      this.inputFormatter,
      this.prefixText,
      this.obscureText = false,
      this.validators,
      this.keyboardType,
      this.isLabelWidget = false,
      required this.labelWidget,
      this.suffixIcon})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: widget.isLabelWidget == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.label ?? "",
              style: TextStyle(
                  fontFamily: GoogleFonts.openSans().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.grayColor),
              textAlign: TextAlign.center,
            ),
            widget.labelWidget
          ],
        ),
        SizedBox(
          height: screenSize.height * .01,
        ),
        TextFormField(
          validator: widget.validators,
          controller: widget.controller,
          cursorColor: AppTheme.primaryColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: dimensH(screenSize.height * .005),
                horizontal: dimensW(screenSize.width * .05)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: AppTheme.secondaryColor,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: AppTheme.errorColor,
                )),
            prefixText: widget.prefixText,
            hintStyle: TextStyle(fontSize: 16),
            suffixIcon: widget.obscureText
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                        print(_isObscure);
                      });
                    },
                    child: _isObscure
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: SvgPicture.asset(
                              Images.view,
                              height: 1,
                              width: 1,
                              color: AppTheme.grayColor,
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: SvgPicture.asset(
                              Images.hide,
                              height: 1,
                              width: 1,
                              color: AppTheme.secondaryColor,
                            ),
                          ),
                  )
                : widget.suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 1,
                color: AppTheme.grayColor,
              ),
            ),
          ),
          keyboardType: widget.keyboardType ?? TextInputType.text,
          inputFormatters: widget.inputFormatter,
          obscureText: widget.obscureText
              ? _isObscure
              : false, // Only numbers can be entered
        ),
        SizedBox(
          height: screenSize.height * .03,
        ),
      ],
    );
  }
}
