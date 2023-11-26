import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/model/news_event_model.dart';
import 'package:st_peters_jacobite_church_flutter/screens/about_church/about_church_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/area_units/area_units_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/church_officials/church_officials_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/about_church/web_view/webview_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/about_church/web_view/description_with_title_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/home/home_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/login/request_otp_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/login/verify_otp_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/members/member_and_spouset_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/members/members_family_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/members/members_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/news_and_events/image_view_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/news_and_events/news_and_events_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/spiritual_organisations/spiritual_organisations_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/splash/splash_screen.dart';
import 'package:st_peters_jacobite_church_flutter/screens/vicars/vicars_screen.dart';

import '../screens/downloads/download_screen.dart';
import '../screens/news_and_events/news_and_events_details_screen.dart';
import '../screens/prayer_timing/prayer_timing_screen.dart';

class AppRoutes {
  static const init = '/';
  static const home = 'home';
  static const aboutChurch = '/about_church';
  static const webView = '/web_view';
  static const descriptionWithTitle = '/description_with_title';
  static const churchOfficials = '/church_officials';
  static const spiritualOrganisations = '/spiritual_organisations';
  static const areaUnits = '/area_units';
  static const prayerTiming = '/preyer_timing';
  static const downloads = '/downloads';
  static const newsAndEvents = '/news_and_events';
  static const newsAndEventsDetails = '/news_and_events_details';
  static const members = '/members';
  static const memberFamily = '/member_family';
  static const vicars = '/vicars';
  static const memberSpouset = '/member_spouset';
  static const requestOTP = '/request_otp';
  static const verifyOTP = '/verify_otp';
  static const imageView = '/image_view';
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.init:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomeScreen());

    case AppRoutes.aboutChurch:
      return MaterialPageRoute(builder: (context) => const AboutChurchScreen());

    case AppRoutes.prayerTiming:
      return MaterialPageRoute(
          builder: (context) => const PreyerTimingScreen());
    case AppRoutes.downloads:
      return MaterialPageRoute(builder: (context) => const DownloadScreen());

    case AppRoutes.webView:
      return MaterialPageRoute(
          builder: (context) =>
              WebViewScreen(url: settings.arguments as String));

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

    case AppRoutes.newsAndEvents:
      return MaterialPageRoute(
          builder: (context) => const NewsAndEventsScreen());

    case AppRoutes.newsAndEventsDetails:
      return MaterialPageRoute(
          builder: (context) => NewsAndEventsDetailsScreen(
                news: settings.arguments as NewsEvents,
              ));

    case AppRoutes.members:
      return MaterialPageRoute(builder: (context) => const MembersScreen());

    case AppRoutes.vicars:
      return MaterialPageRoute(builder: (context) => const VicarsScreen());

    case AppRoutes.memberFamily:
      return MaterialPageRoute(
        builder: (context) =>
            MembersFamilyScreen(memberId: settings.arguments as String),
      );

    case AppRoutes.memberSpouset:
      return MaterialPageRoute(
          builder: (context) => const MemberAndSpousetScreen());

    case AppRoutes.requestOTP:
      return MaterialPageRoute(builder: (context) => RequestOTPScreen());

    case AppRoutes.verifyOTP:
      return MaterialPageRoute(
          builder: (context) => VerifyOTPScreen(
                memberCode: settings.arguments as String,
              ));

    case AppRoutes.imageView:
      return MaterialPageRoute(
          builder: (context) =>
              ImageViewScreen(images: settings.arguments as List<String>));

    default:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
  }
}
