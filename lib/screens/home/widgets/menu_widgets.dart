import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';

import '../../../theme/assets.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  static double heightDivider = 32;
  static double height = 500;
  static double iconHeight = 24;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: height,
        ),
        Positioned(
          left: -300,
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
          left: 85,
          top: heightDivider,
          child: menuIcons(AppAssets.homeAboutChurch, 'ABOUT THE CHURCH'),
        ),
        Positioned(
          left: 140,
          top: (heightDivider * 2) + iconHeight * 1,
          child: menuIcons(AppAssets.homeChurchOfficials, 'CHURCH OFFICIALS'),
        ),
        Positioned(
          left: 170,
          top: (heightDivider * 3) + iconHeight * 2,
          child: menuIcons(AppAssets.homeSpiritual, 'SPIRITUAL\nORGANIZATIONS'),
        ),
        Positioned(
          left: 185,
          top: (heightDivider * 4) + iconHeight * 3,
          child: menuIcons(AppAssets.homeAreaUnit, 'AREA UNITS'),
        ),
        Positioned(
          left: 185,
          top: (heightDivider * 5) + iconHeight * 4,
          child: menuIcons(AppAssets.homeMember, 'MEMBERS'),
        ),
        Positioned(
          left: 175,
          top: (heightDivider * 6) + iconHeight * 5,
          child: menuIcons(AppAssets.homeNewsEvents, 'NEWS & EVENTS'),
        ),
        Positioned(
          left: 150,
          top: (heightDivider * 7) + iconHeight * 6,
          child: menuIcons(AppAssets.homeDownloads, 'DOWNLOADS'),
        ),
        Positioned(
          left: 100,
          top: (heightDivider * 8) + iconHeight * 7,
          child: menuIcons(AppAssets.homePrayerTime, 'PRAYER TIMES'),
        ),
      ],
    );
  }

  Widget menuIcons(String icon, String label) {
    return Row(
      children: [
        Image.asset(icon, scale: 4),
        const SizedBox(width: 10),
        Text(
          label,
          style: textTheme.titleSmall,
        ),
      ],
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
