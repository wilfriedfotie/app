import 'package:LASYLAB/feature/authentication/presentation/pages/choose_strong_topics.dart';
import 'package:LASYLAB/views/see_answer.dart';
import 'package:flutter/cupertino.dart';

import 'feature/activities/presentation/pages/activities.dart';
import 'feature/authentication/presentation/pages/payment_intro_page.dart';
import 'feature/authentication/presentation/pages/profil.dart';
import 'feature/chat/presentation/pages/chat_page.dart';
import 'feature/chat/presentation/pages/discussion_page.dart';
import 'feature/courses/presentation/page/course_reader.dart';
import 'feature/courses/presentation/page/course_reading.dart';
import 'feature/courses/presentation/page/details_course_revisions.dart';
import 'feature/courses/presentation/page/home.dart';
import 'feature/courses/presentation/page/quiz_answer.dart';
import 'feature/courses/presentation/page/quiz_launcher.dart';
import 'feature/courses/presentation/page/video_course_reading.dart';
import 'views/account_choice.dart';
import 'views/chat_background.dart';
import 'views/classes_choice.dart';
import 'views/congratulation.dart';
import 'views/fees_formula.dart';
import 'views/fees_welcome.dart';
import 'views/login.dart';
import 'views/menu.dart';
import 'views/onboarding_screen.dart';
import 'views/otpscreen.dart';
import 'views/pre_inscription.dart';
import 'views/register.dart';
import 'views/research_page.dart';

final routes = {
  "/": (BuildContext context) => OnboardingScreen(),
  LoginPage.routeName: (BuildContext context) => LoginPage(),
  "/register": (BuildContext context) => RegisterPage(),
  "/congratulations": (BuildContext context) => Congratulations(),
  "/account_choice": (BuildContext context) => AccountChoicePage(),
  "/classes_choice": (BuildContext context) => ClassesChoice(),
  "/welcome_fees": (BuildContext context) => WelcomeFees(),
  "/fees_formula": (BuildContext context) => FeesFormula(),
  Menu.routeName: (BuildContext context) => Menu(),
  HomePage.routeName: (BuildContext context) => HomePage(),
  "/activities": (BuildContext context) => ActivitiesPage(),
  "/revisions": (BuildContext context) => DetailsCourseRevision(),
  "/chat": (BuildContext context) => ChatPage(),
  DiscussionPage.routeName: (BuildContext context) => DiscussionPage(),
  "/profil": (BuildContext context) => ProfilPage(),
  "/course_status": (BuildContext context) => VideoCourseReading(),
  "/course_reader": (BuildContext context) => CourseReader(),
  "/quiz_launcher": (BuildContext context) => QuizLauncher(),
  "/quiz_answer": (BuildContext context) => QuizTest(),
  "/chat_background": (BuildContext context) => ChatBackground(),
  "/research": (BuildContext context) => ResearchPage(),
  PreInscription.routeName: (BuildContext context) => PreInscription(),
  "/otpscreen": (BuildContext context) => OTPScreen(),
  "/payment_registration_type": (BuildContext context) => PaymentIntroPage(),
  "/see_answer_quiz": (BuildContext context) => SeeQuizAnswer(),
  "/course_reading": (BuildContext context) => CourseReading(),
  ChooseStrongTopics.routeName: (BuildContext context) => ChooseStrongTopics(),
};
