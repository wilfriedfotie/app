import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../size_config.dart';
import '../styling.dart';

class SelectFormField extends StatefulWidget {
  final String? label;
  final String value;
  final Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  const SelectFormField(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.items,
      this.label})
      : super(key: key);

  @override
  _SelectFormFieldState createState() => _SelectFormFieldState();
}

class _SelectFormFieldState extends State<SelectFormField> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Center(
            child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * .03,
              vertical: dimensH(screenSize.height * .006)),
          height: dimensH(50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: AppTheme.grayColor,
                  width: 1,
                  style: BorderStyle.solid)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                isExpanded: true,
                value: widget.value,
                items: widget.items,
                onChanged: widget.onChanged),
          ),
        )),
        SizedBox(
          height: screenSize.height * .03,
        ),
      ],
    );
  }
}
