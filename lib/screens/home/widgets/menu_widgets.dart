import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/secure_storage.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';

import '../../../theme/assets.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  static const double _heightDivider = 28;
  static const double _height = 450;
  static const double _iconHeight = 24;
  String _memberRoute = '';
  @override
  void initState() {
    super.initState();
    _getRouteName();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(
          height: _height,
          width: _height,
        ),
        Positioned(
          left: -200,
          top: 22,
          child: SizedBox(
            height: 450,
            child: Image.asset(
              AppAssets.imageChrist,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Positioned(
          left: -220,
          child: ClipPath(
            clipper: HalfCircleClip(),
            child: Container(
              height: _height,
              width: _height,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.amber,
                border: Border.all(
                  color: AppColors.yellowFFCD09,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 120,
          top: _heightDivider,
          child: menuIcons(context, AppAssets.homeAboutChurch,
              'ABOUT THE CHURCH', AppRoutes.aboutChurch),
        ),
        Positioned(
          left: 175,
          top: (_heightDivider * 2) + _iconHeight * 1,
          child: menuIcons(context, AppAssets.homeChurchOfficials,
              'CHURCH OFFICIALS', AppRoutes.churchOfficials),
        ),
        Positioned(
          left: 200,
          top: (_heightDivider * 3) + _iconHeight * 2,
          child: menuIcons(context, AppAssets.homeSpiritual,
              'SPIRITUAL\nORGANIZATIONS', AppRoutes.spiritualOrganisations),
        ),
        Positioned(
          left: 215,
          top: (_heightDivider * 4) + _iconHeight * 3,
          child: menuIcons(context, AppAssets.homeAreaUnit, 'AREA UNITS',
              AppRoutes.areaUnits),
        ),
        Positioned(
          left: 215,
          top: (_heightDivider * 5) + _iconHeight * 4,
          child: menuIcons(
              context, AppAssets.homeMember, 'MEMBERS', AppRoutes.members),
        ),
        Positioned(
          left: 205,
          top: (_heightDivider * 6) + _iconHeight * 5,
          child: menuIcons(context, AppAssets.homeNewsEvents, 'NEWS & EVENTS',
              AppRoutes.newsAndEvents),
        ),
        Positioned(
          left: 175,
          top: (_heightDivider * 7) + _iconHeight * 6,
          child: menuIcons(context, AppAssets.homeDownloads, 'DOWNLOADS',
              AppRoutes.downloads),
        ),
        Positioned(
          left: 120,
          top: (_heightDivider * 8) + _iconHeight * 7,
          child: menuIcons(context, AppAssets.homePrayerTime, 'PRAYER TIMES',
              AppRoutes.prayerTiming),
        ),
      ],
    );
  }

  Widget menuIcons(
      BuildContext context, String icon, String label, String routeName) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Row(
        children: [
          Image.asset(icon, scale: 4),
          const SizedBox(width: 10),
          Text(
            label,
            style: textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  Future<void> _getRouteName() async {
    final res = await StorageUtils().checkUserAuthentication();
    if (res) {
      _memberRoute = AppRoutes.members;
    } else {
      _memberRoute = AppRoutes.requestOTP;
    }
    setState(() {});
  }
}

class HalfCircleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    Path path = Path();

    path.lineTo(width / 2, 0);
    path.lineTo(width / 2, height);
    path.lineTo(height, height);
    path.lineTo(width, 0);

    // path.lineTo(height, height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
