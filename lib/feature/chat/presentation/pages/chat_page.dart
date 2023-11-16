import 'package:LASYLAB/components/fancy_button.dart';
import 'package:LASYLAB/core/components/images.dart';
import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  AnimationController? animationcontroller;
  int _viewType = 1;
  List<String> courses = [
    "mathématique",
    "science",
    "francais",
    "philosophie",
    "physique"
  ];
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent, // navigation bar color
        statusBarColor: Color(0xffED9B0C),
        statusBarIconBrightness: Brightness.light, // status bar color
      ),
    );
    animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationcontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pushNamed("/discussions");
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              "assets/images/Edit.png",
            ),
          ),
        ),
        backgroundColor: Color(0xff235390),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: screenSize.height * .2,
              width: double.infinity,
              padding: EdgeInsets.only(top: screenSize.height * .035),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffED9B0C),
                      Color.fromRGBO(254, 147, 48, 0.8),
                    ],
                  )),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: dimensH(25, sm: 35),
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        Container(
                          height: dimensH(screenSize.height * .07,
                              sm: screenSize.height * .1),
                          width: dimensW(screenSize.width * .14,
                              sm: screenSize.width * .18),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.blueColor.withOpacity(.2),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/chemistry.png"))),
                        ),
                        SizedBox(
                          width: dimensW(0, sm: 10),
                        ),
                        Text(
                          "DISCUTIONS".toUpperCase(),
                          style: TextStyle(
                              fontSize: dimensH(3.5 * SizeConfig.textMultiplier,
                                  sm: 24),
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: dimensW(screenSize.width * .2,
                              sm: screenSize.width * .15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/profil");
                          },
                          child: CircleAvatar(
                            child: Image.asset("assets/images/avatar.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: dimensH(screenSize.height * .02),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * .14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _viewType = 1;
                            });
                          },
                          child: AnimatedContainer(
                            width: screenSize.width * .3,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: _viewType == 1
                                    ? Colors.white.withOpacity(.75)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30)),
                            duration: Duration(milliseconds: 200),
                            child: Text(
                              "MATIERES".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  fontFamily:
                                      GoogleFonts.openSans().fontFamily),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _viewType = 2;
                            });
                          },
                          child: AnimatedContainer(
                            width: screenSize.width * .3,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: _viewType == 2
                                    ? Colors.white.withOpacity(.75)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30)),
                            duration: Duration(milliseconds: 200),
                            child: Text(
                              "MEDIAS".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  fontFamily:
                                      GoogleFonts.openSans().fontFamily),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: screenSize.height - screenSize.height * .22,
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * .1),
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * .05,
                  ),
                  Visibility(
                    visible: _viewType == 1,
                    child: Column(
                      children: [
                        ...courses
                            .map((e) => Column(
                                  children: [
                                    SizedBox(
                                      height: dimensH(screenSize.height * .045),
                                    ),
                                    SizedBox(
                                      height: dimensH(screenSize.height * .07,
                                          sm: screenSize.height * .05),
                                      width: double.maxFinite,
                                      child: FancyButton(
                                        counter: 1,
                                        counterColor: AppTheme.primaryColor,
                                        size: 15,
                                        color: AppTheme.whiteColor,
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed("/discussions");
                                        },
                                        duration:
                                            const Duration(milliseconds: 160),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("$e".toUpperCase(),
                                                style: TextStyle(
                                                    color: Color(0xff777777),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList()
                      ],
                    ),
                  ),
                  Visibility(
                      visible: _viewType == 2,
                      child: Expanded(
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.75,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: screenSize.height * .04,
                                  crossAxisSpacing: screenSize.width * .1),
                          itemCount: 12,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // height: screenSize.height * .12,
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenSize.width * .1,
                                  vertical: screenSize.height * .08),
                              decoration: BoxDecoration(
                                color: Color(0xffE5E5E5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image(
                                // height: screenSize.height * .25,
                                // width: screenSize.width * .25,
                                color: AppTheme.grayColor,
                                image: AssetImage(Images.default_image_icon),
                              ),
                            );
                          },
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
