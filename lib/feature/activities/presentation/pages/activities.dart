import 'package:LASYLAB/core/components/images.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/feature/activities/presentation/widgets/activity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  int _value = 1;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarColor: Colors.white, //HexColor("#FCF6F4"),
        statusBarIconBrightness: Brightness.dark, // status bar color
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leadingWidth: screenSize.width * .3,
          leading: Padding(
            padding: EdgeInsets.only(left: screenSize.width * .05),
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/profil");
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(Images.star),
                  ),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(Images.app_ruby),
                ),
                Text(
                  "2",
                  style: GoogleFonts.nunito(
                    color: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/profil");
                },
                child: CircleAvatar(
                  child: Image.asset("assets/images/avatar.png"),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(20),
            children: [
              Container(
                height: screenSize.height * .05,
                width: screenSize.width * .25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Images.decoration_bar))),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: dimensH(screenSize.height * .009),
                    ),
                    Text(
                      "revisions".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontSize:
                              dimensH(1.8 * SizeConfig.textMultiplier, sm: 15),
                          color: Color(0xff864312)),
                    ),
                  ],
                ),
              ),
              ActivityWidget(
                screenSize: screenSize,
                title: "méthode",
              ),
              ActivityWidget(
                screenSize: screenSize,
                title: "Définition",
              ),
              ActivityWidget(
                screenSize: screenSize,
                title: "Epreuve",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
