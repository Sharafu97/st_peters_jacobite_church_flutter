import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/screens/about_church/about_church_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/area_units/area_units_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/church_officials/church_officials_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/description/description_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/description/description_with_title_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/home/home_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/spiritual_organisations/spiritual_organisations_screen.dart';

class AppRoutes {
  static const init = '/';
  static const home = 'home';
  static const aboutChurch = '/about_church';
  static const description = '/description';
  static const descriptionWithTitle = '/description_with_title';
  static const churchOfficials = '/church_officials';
  static const spiritualOrganisations = '/spiritual_organisations';
  static const areaUnits = '/area_units';
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

    case AppRoutes.churchOfficials:
      return MaterialPageRoute(
          builder: (context) => const ChurchOfficialsScreen());

    case AppRoutes.spiritualOrganisations:
      return MaterialPageRoute(
          builder: (context) => const SpiritualOrganisationsScreen());

    case AppRoutes.areaUnits:
      return MaterialPageRoute(builder: (context) => const AreaUnitsScreen());

    default:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
