import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class BiographiePage extends StatefulWidget {
  const BiographiePage({Key? key}) : super(key: key);

  @override
  _BiographiePageState createState() => _BiographiePageState();
}

class _BiographiePageState extends State<BiographiePage> {
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
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: HexColor("#AFAFAF"),
              ),
            ),
            centerTitle: true,
          ),
          body: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Mon cursus",
                  style: GoogleFonts.openSans(
                    color: HexColor("#1CB0F6"),
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "J’ai frequenté au lycée elig essono une année avant de debarqué au lycée d'Emana, je suis une personne agréable à vivre.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.openSans(
                    color: HexColor("#3C3C3C"),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
