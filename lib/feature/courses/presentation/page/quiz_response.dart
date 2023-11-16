import 'package:LASYLAB/core/components/styling.dart';
import 'package:flutter/material.dart';

class QuizResponse extends StatefulWidget {
  const QuizResponse({Key? key}) : super(key: key);

  @override
  _QuizResponseState createState() => _QuizResponseState();
}

class _QuizResponseState extends State<QuizResponse> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: AppTheme.borderColor,
              size: 40,
            ),
          ),
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: screenSize.width * 0.9,
            height: 9,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: LinearProgressIndicator(
                value: 0.66,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xff58CC02),
                ),
                backgroundColor: Color(0xffE5E5E5),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: screenSize.height * .8,
              margin: EdgeInsets.symmetric(horizontal: screenSize.width * .045),
              decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(21)),
            )
          ],
        ),
      ),
    );
  }
}
