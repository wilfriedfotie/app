import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/feature/courses/presentation/widgets/progress_course_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCourseRevision extends StatefulWidget {
  const DetailsCourseRevision({Key? key}) : super(key: key);

  @override
  _DetailsCourseRevisionState createState() => _DetailsCourseRevisionState();
}

class _DetailsCourseRevisionState extends State<DetailsCourseRevision> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.scaffoldBgColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppTheme.grayColor,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: AppTheme.scaffoldBgColor,
        body: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: dimensH(screenSize.height * .02,
                        sm: screenSize.height * .024),
                  ),
                  Container(
                    height: screenSize.height * .8,
                    margin: EdgeInsets.symmetric(
                        horizontal: screenSize.width * .045),
                    decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(21)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * .2),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          SizedBox(
                            height: screenSize.height * .05,
                          ),
                          ProgressCourseBar(
                            isReading: true,
                          ),
                          ...[1, 2, 3, 4].map((e) => ProgressCourseBar(
                                isReading: false,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: dimensH(0, sm: 0),
              left: dimensW(screenSize.width * .25),
              child: Container(
                height: dimensH(35, sm: 45),
                width: dimensW(screenSize.width * .5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppTheme.warningColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "MATHEMATIQUES -  1e",
                  style: TextStyle(
                      fontSize:
                          dimensH(1.85 * SizeConfig.textMultiplier, sm: 16),
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.openSans().fontFamily),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
