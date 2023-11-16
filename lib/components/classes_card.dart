import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ClassesCard extends StatefulWidget {
  final String classeName;
  late final bool isSelected;

  ClassesCard({
    Key? key,
    required this.classeName,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<ClassesCard> createState() => _ClassesCardState();
}

class _ClassesCardState extends State<ClassesCard> {
  
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: 50,
        width: 50,
        child: Center(
          child: Text(
            widget.classeName,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              color: widget.isSelected ? HexColor("#1899D6") : Colors.black,
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: widget.isSelected ? HexColor("#DDF4FF") : Colors.white,
          border: Border.all(
            width: 1.5,
            color: widget.isSelected ? HexColor("#1899D6") : HexColor("#AFAFAF"),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
