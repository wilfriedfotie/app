import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DiscussionTile extends StatefulWidget {
  const DiscussionTile({
    Key? key,
    required this.teacherName,
    required this.backgroundColor,
    required this.illustration,
    required this.teacherCourse,
    required this.lastMessage,
    required this.sendHour,
  }) : super(key: key);

  final String backgroundColor;
  final String illustration;
  final String teacherCourse;
  final String teacherName;
  final String lastMessage;
  final String sendHour;

  @override
  _DiscussionTileState createState() => _DiscussionTileState();
}

class _DiscussionTileState extends State<DiscussionTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: Border(
          bottom: BorderSide(
            style: BorderStyle.solid,
            color: HexColor("#E5E5E5"),
          ),
        ),
        leading: Stack(
          //alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: HexColor(widget.backgroundColor),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(widget.illustration),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 45,
                height: 10,
                decoration: BoxDecoration(
                  color: HexColor("#DDF4FF"),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.teacherCourse,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      color: HexColor("#1CB0F6"),
                      textStyle: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        title: Text(
          widget.teacherName,
          style: GoogleFonts.nunito(
            color: HexColor("#235390"),
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(
          widget.lastMessage,
          style: GoogleFonts.nunito(
            color: Colors.black,
            textStyle: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        trailing: Text(
          widget.sendHour,
          style: GoogleFonts.nunito(
            color: Colors.black,
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
