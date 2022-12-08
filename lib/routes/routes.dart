import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String viewProfile = '/profileView';
  static const String addRecord = '/addRecord';
  static const String introduction = '/introduction';

  static final routes = <String, WidgetBuilder>{
    introduction: (BuildContext context) => IntroductionScreen(),
    // home: (BuildContext context) => const HomeScreen(),
    // profile: (BuildContext context) => const ProfileScreen(),
    // viewProfile: (BuildContext context) => const ViewProfile(),
    // addRecord: (BuildContext context) => const AddRecord(),
  };
}
