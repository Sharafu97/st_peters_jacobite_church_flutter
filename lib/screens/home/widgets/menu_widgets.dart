import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/route.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';

import '../../../theme/assets.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  static double heightDivider = 28;
  static double height = 450;
  static double iconHeight = 24;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: height,
          width: height,
        ),
        Positioned(
          left: -200,
          top: 22,
          child: SizedBox(
            height: 450,
            child: Image.asset(
              AppAssets.christ,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Positioned(
          left: -220,
          child: ClipPath(
            clipper: HalfCircleClip(),
            child: Container(
              height: height,
              width: height,
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
          top: heightDivider,
          child: menuIcons(
              context, AppAssets.homeAboutChurch, 'ABOUT THE CHURCH', ''),
        ),
        Positioned(
          left: 175,
          top: (heightDivider * 2) + iconHeight * 1,
          child: menuIcons(
              context, AppAssets.homeChurchOfficials, 'CHURCH OFFICIALS', ''),
        ),
        Positioned(
          left: 200,
          top: (heightDivider * 3) + iconHeight * 2,
          child: menuIcons(
              context, AppAssets.homeSpiritual, 'SPIRITUAL\nORGANIZATIONS', ''),
        ),
        Positioned(
          left: 215,
          top: (heightDivider * 4) + iconHeight * 3,
          child: menuIcons(context, AppAssets.homeAreaUnit, 'AREA UNITS', ''),
        ),
        Positioned(
          left: 215,
          top: (heightDivider * 5) + iconHeight * 4,
          child: menuIcons(context, AppAssets.homeMember, 'MEMBERS', ''),
        ),
        Positioned(
          left: 205,
          top: (heightDivider * 6) + iconHeight * 5,
          child: menuIcons(context, AppAssets.homeNewsEvents, 'NEWS & EVENTS',
              AppRoutes.newsAndEvents),
        ),
        Positioned(
          left: 175,
          top: (heightDivider * 7) + iconHeight * 6,
          child: menuIcons(context, AppAssets.homeDownloads, 'DOWNLOADS',
              AppRoutes.downloads),
        ),
        Positioned(
          left: 120,
          top: (heightDivider * 8) + iconHeight * 7,
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
