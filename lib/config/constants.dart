// ignore_for_file: constant_identifier_names

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
  static const largePadding = 30.0;
  static const extraLargePadding = 40.0;
  bool isIOS = false;
  String fcmToken = '';

  ///[FONT_FAMILIES]
  static const fontBrighton = 'Brighton';
  static const fontGotham = 'Gotham';
  static const fontGregorian = 'Gregorian';
  static const fontRikon = 'Rikon';

  void _setPlatform() {
    isIOS = Platform.isIOS;
  }

  static const loremIpsum =
      'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\n“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”\nThe purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\nThe passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our generator to get your own, or read on for the authoritative history of lorem ipsum.\nLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\n“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”\nThe purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\nThe passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our generator to get your own, or read on for the authoritative history of lorem ipsum.';

  ///[API]
  static const BASEURL = 'insta-connect.in';
  static const MEMBERLISTURL = '/churchapplive/api/member-list';
  static const LOGINURL = '/churchapplive/api/member-login';
  static const OTPVERIFICATIONURL = 'churchapplive/api/send-otp';
  static const MEMBERDETAILSURL = '/churchapplive/api/member-details';
  static const AREAUNITSURL = '/churchapplive/api/area-unit-list';
  static const SEARCHMEMBERURL = '/churchapplive/api/search';
  static const DOWNLOADLISTURL = '/churchapplive/api/downloads';

  ///[STATIC WEB PAGES]
  static const churchHistoryURL =
      'https://insta-connect.in/churchapplive/history';
  static const bishopsURL = 'https://insta-connect.in/churchapplive/bishops';
  static const formerVicarsURL =
      'https://insta-connect.in/churchapplive/former-vicars';
  static const catholicosURL =
      'https://insta-connect.in/churchapplive/catholicos';
  static const founderMemberURL =
      'https://insta-connect.in/churchapplive/founder-members';
  static const partiarchURL =
      'https://insta-connect.in/churchapplive/partiarch';
  static const partiarcalVicarURL =
      'https://insta-connect.in/churchapplive/patriarcal-vicar';
  static const currentVicarURL =
      'https://insta-connect.in/churchapplive/current-vicar';
  static const formarPartiarcalVicarURL =
      'https://insta-connect.in/churchapplive/formar-patriarcal-vicars';
  static const prayerTimingURL = 'https://insta-connect.in/churchapplive/time';

  ///[contact details]
  static const CHURCHPHONE = '+97317245432';
  static const CHURCHMAIL = 'stpeters@batelco.com.bh';
  static const CHURCHWEBSITE = 'http://www.stpetersbahrain.org/';
  static const CHURCHLOCATION = 'https://maps.app.goo.gl/VokT7tfbyReV5Xzx6';
}
