import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/assets.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  static double heightDivider = (400 / 6);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 400,
          width: 400,
          color: Colors.red,
        ),
        Positioned(
          left: -200,
          child: ClipPath(
            clipper: HalfCircleClip(),
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
            ),
          ),
        ),
        Positioned(
          left: 60,
          top: heightDivider * 0,
          child: menuIcons(AppIcons.homeAboutChurch, 'ABOUT THE CHURCH'),
        ),
        Positioned(
          left: 130,
          top: heightDivider * 1,
          child: menuIcons(AppIcons.homeChurchOfficials, 'CHURCH OFFICIALS'),
        ),
        Positioned(
          left: 170,
          top: heightDivider * 2,
          child: menuIcons(AppIcons.homeSpiritual, 'SPIRITUAL ORGANIZATIONS'),
        ),
        Positioned(
          left: 185,
          top: heightDivider * 3,
          child: menuIcons(AppIcons.homeAreaUnit, 'AREA UNITS'),
        ),
        Positioned(
          left: 190,
          top: heightDivider * 4,
          child: menuIcons(AppIcons.homeMember, 'MEMBERS'),
        ),
        Positioned(
          left: 180,
          top: heightDivider * 5,
          child: menuIcons(AppIcons.homeNewsEvents, 'NEWS & EVENTS'),
        ),
        Positioned(
          left: 155,
          top: heightDivider * 6,
          child: menuIcons(AppIcons.homeDownloads, 'DOWNLOADS'),
        ),
        Positioned(
          left: 110,
          top: heightDivider * 7,
          child: menuIcons(AppIcons.homePrayerTime, 'PRAYER TIMES'),
        ),
      ],
    );
  }

  Widget menuIcons(String icon, String label) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 24),
        Text(label),
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
