import 'package:LASYLAB/components/fancy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ResearchPage extends StatefulWidget {
  const ResearchPage({Key? key}) : super(key: key);

  @override
  _ResearchPageState createState() => _ResearchPageState();
}

class _ResearchPageState extends State<ResearchPage> {
  // int _value = 1;

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
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          leadingWidth: 140,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset("assets/images/star.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/images/ruby.png"),
                  ),
                  Text(
                    "2",
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
            padding: EdgeInsets.all(40),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: HexColor("#AFAFAF"),
                      ),
                    ),
                    filled: true,
                    hintStyle: GoogleFonts.nunito(
                      color: HexColor("#AFAFAF"),
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    hintText: "Rechercher un cours ou une notion",
                    fillColor: Colors.white70,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 50,
                ),
                child: SizedBox(
                  height: screenSize.height * .06,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: HexColor("#1CB0F6"),
                            size: 25,
                          ),
                          Text(
                            "RECHERCHER",
                            style: GoogleFonts.openSans(
                              color: HexColor("#AFAFAF"),
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
