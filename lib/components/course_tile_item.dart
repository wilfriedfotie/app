import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CourseTileItem extends StatelessWidget {
  final HexColor backgroundColor;
  final IconData icon;
  final double progression;

  const CourseTileItem({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.progression,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              strokeWidth: 4,
              backgroundColor: HexColor("#C4C4C4"),
              valueColor: AlwaysStoppedAnimation<Color>(
                HexColor("#FFD900"),
              ),
              value: progression,
            ),
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: CircleAvatar(
              backgroundColor: backgroundColor,
              child: IconButton(
                iconSize: 14,
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
