import 'dart:io';

class AppConstants {
  AppConstants._privateConstructor();
  factory AppConstants() {
    return _instance;
  }
  void init() {
    _setPlatform();
    // _setFCMToken();
  }

  static final AppConstants _instance = AppConstants._privateConstructor();

  static const defaultPadding = 20.0;
  static const smallPadding = 10.0;
  static const extraSmallPadding = 7.0;
  bool isIOS = false;
  static const baseUrl = '';
  String fcmToken = '';

  ///[FONT_FAMILIES]
  static const fontBrighton = 'Brighton';
  static const fontGotham = 'Gotham';
  static const fontGregorian = 'Gregorian';
  static const fontRikon = 'Rikon';

  void _setPlatform() {
    isIOS = Platform.isIOS;
  }

  // void _setFCMToken() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   fcmToken = await messaging.getToken() ?? '';
  // }
}
