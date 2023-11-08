import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/screens/about_church/about_church_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/description/description_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/description/description_with_title_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/home/home_screen.dart';

class AppRoutes {
  static const init = '/';
  static const home = 'home';
  static const aboutChurch = '/about_church';
  static const description = '/description';
  static const descriptionWithTitle = '/description_with_title';
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomeScreen());

    case AppRoutes.aboutChurch:
      return MaterialPageRoute(builder: (context) => const AboutChurchScreen());

    case AppRoutes.description:
      return MaterialPageRoute(builder: (context) => const DescriptionScreen());

    case AppRoutes.descriptionWithTitle:
      return MaterialPageRoute(
          builder: (context) => const DescriptionWithTitleScreen());

    default:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
