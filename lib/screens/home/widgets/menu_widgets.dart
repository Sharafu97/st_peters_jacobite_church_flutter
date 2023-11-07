import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/assets.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  static double heightDivider = 22;
  static double height = 400;
  static double iconHeight = 24;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: height,
          color: Colors.red,
        ),
        Positioned(
          left: -200,
          child: ClipPath(
            clipper: HalfCircleClip(),
            child: Container(
              height: height,
              width: height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
            ),
          ),
        ),
        Positioned(
          left: 100,
          top: heightDivider,
          child: menuIcons(AppIcons.homeAboutChurch, 'ABOUT THE CHURCH'),
        ),
        Positioned(
          left: 150,
          top: (heightDivider * 2) + iconHeight * 1,
          child: menuIcons(AppIcons.homeChurchOfficials, 'CHURCH OFFICIALS'),
        ),
        Positioned(
          left: 175,
          top: (heightDivider * 3) + iconHeight * 2,
          child: menuIcons(AppIcons.homeSpiritual, 'SPIRITUAL ORGANIZATIONS'),
        ),
        Positioned(
          left: 185,
          top: (heightDivider * 4) + iconHeight * 3,
          child: menuIcons(AppIcons.homeAreaUnit, 'AREA UNITS'),
        ),
        Positioned(
          left: 185,
          top: (heightDivider * 5) + iconHeight * 4,
          child: menuIcons(AppIcons.homeMember, 'MEMBERS'),
        ),
        Positioned(
          left: 180,
          top: (heightDivider * 6) + iconHeight * 5,
          child: menuIcons(AppIcons.homeNewsEvents, 'NEWS & EVENTS'),
        ),
        Positioned(
          left: 155,
          top: (heightDivider * 7) + iconHeight * 6,
          child: menuIcons(AppIcons.homeDownloads, 'DOWNLOADS'),
        ),
        Positioned(
          left: 110,
          top: (heightDivider * 8) + iconHeight * 7,
          child: menuIcons(AppIcons.homePrayerTime, 'PRAYER TIMES'),
        ),
      ],
    );
  }

  Widget menuIcons(String icon, String label) {
    return
        // Row(
        //   children: [
        SvgPicture.asset(icon, height: 24);
    //     Text(label),
    //   ],
    // );
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
