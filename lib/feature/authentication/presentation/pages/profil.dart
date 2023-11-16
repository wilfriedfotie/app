import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/feature/authentication/data/models/profil_item.dart';
import 'package:LASYLAB/feature/authentication/presentation/widgets/profil_element.dart';
import 'package:LASYLAB/models/user.dart';
import 'package:LASYLAB/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  Usermodel? user;
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    user = DBService().getLocalUser();
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
              Icons.close,
              color: AppTheme.grayColor,
              size: 35,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.textBlueColor,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset("assets/images/Female_Memojis.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * .02,
              ),
              Text(
                "VANESSA",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: dimensH(3.1 * SizeConfig.textMultiplier, sm: 24),
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textBlueColor),
              ),
              SizedBox(
                height: screenSize.height * .02,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * .06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...data
                        .map((e) => profileItem(
                            onPressed: e.onPressed,
                            title: e.title,
                            screenSize: screenSize))
                        .toList(),
                    Text(
                      "6 77 51 88 62",
                      style: TextStyle(
                          color: AppTheme.textBlueColor,
                          fontSize:
                              dimensH(3.1 * SizeConfig.textMultiplier, sm: 24),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: dimensH(screenSize.height * .03),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
