import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/screens/about_church/about_church_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/home/home_screen.dart';

class AppRoutes {
  static const init = '/';
  static const home = 'home';
  static const aboutChurch = '/sabout_church';
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case AppRoutes.aboutChurch:
      return MaterialPageRoute(builder: (context) => const AboutChurchScreen());

    default:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
