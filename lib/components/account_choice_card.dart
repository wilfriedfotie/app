import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class AccountChoiceCard extends StatefulWidget {
  AccountChoiceCard({
    Key? key,
    required this.illustration,
    this.isSelected = false,
  }) : super(key: key);

  final String illustration;
  late final bool isSelected;
  @override
  State<AccountChoiceCard> createState() => _AccountChoiceCardState();
}

class _AccountChoiceCardState extends State<AccountChoiceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SvgPicture.asset(
        widget.illustration,
      ),
      //shadowColor: widget.isSelected ? HexColor("#1899D6") : Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          width: 1.5,
          color: widget.isSelected ? HexColor("#1899D6") : Colors.grey,
        ),
      ),
    );
  }
}
