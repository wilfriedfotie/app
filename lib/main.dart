import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/routes.dart';
import 'package:LASYLAB/services/database_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'core/components/styling.dart';
import 'injection_dependencies.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await initDi();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp(initialRoute: "/"));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({this.initialRoute = "/"});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "LASYLAB",
            theme: AppTheme.lightTheme,
            initialRoute: getRoutes(), // initialRoute,
            routes: routes,
          );
        },
      ),
    );
  }
}

String getRoutes() {
  final box = GetStorage();
  bool onboarding = box.read("onboarding") ?? false;

  Usermodel? user = DBService().getLocalUser();

  if (onboarding) {
    if (user != null) {
      return "/welcome_fees";
    } else {
      return "/login";
    }
  } else {
    return "/";
  }
}
