import 'package:LASYLAB/core/components/images.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/feature/courses/data/models/home_course_item.dart';
import 'package:LASYLAB/feature/courses/presentation/widgets/course_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _value = 1;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 2,
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
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: DropdownButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 35,
                      color: AppTheme.grayColor,
                    ),
                    underline: SizedBox(),
                    onChanged: (value) {
                      print("the value selected : $value");
                      setState(() {
                        _value = int.parse(value.toString());
                      });
                    },
                    value: _value,
                    items: [
                      {"id": 1, "value": "Seconde"},
                      {"id": 2, "value": "Première"},
                      {"id": 3, "value": "Terminale"},
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text(
                                "${e["value"]}",
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              value: e["id"],
                            ))
                        .toList()),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: screenSize.width * 0.7,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: LinearProgressIndicator(
                      value: 0,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        HexColor("#FFD900"),
                      ),
                      backgroundColor: HexColor("#E1E1E1"),
                    ),
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.only(
                    top: dimensH(10, sm: 20),
                    bottom: 20,
                    left: dimensW(10, sm: 20),
                    right: dimensW(10, sm: 20)),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  ...courseData
                      .map((e) => CourseItem(
                            backgroundColor: e.courseName == "Philosophie"
                                ? AppTheme.primaryColor
                                : AppTheme.blueColor,
                            courseName: e.courseName,
                            image: e.image,
                            progression: e.progression,
                          ))
                      .toList()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
