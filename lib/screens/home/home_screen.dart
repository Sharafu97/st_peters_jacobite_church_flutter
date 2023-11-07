import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/screens/home/widgets/menu_widgets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';

import '../../widgets/appbar.dart';
import '../../widgets/contact_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Stack(
        children: [
          Positioned(
            right: -30,
            top: 30,
            child: Image.asset(AppAssets.logoWatermark, scale: 3),
          ),
          Positioned(
            right: 0,
            bottom: 45,
            child: Image.asset(AppAssets.church, scale: 4),
          ),
          Column(
            children: [
              const SizedBox(height: 40),
              Text(
                "St. Peter's Jacobite Syrian Orthodox Church",
                style: textTheme.titleLarge?.copyWith(
                  fontFamily: AppConstants.fontGregorian,
                  color: AppColors.yellow,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                'UNDER THE HOLY APOSTOLIC SEE OF ANTIOCH & ALL THE EAST',
                style: textTheme.labelSmall?.copyWith(
                  fontFamily: AppConstants.fontGotham,
                  letterSpacing: -0.1,
                  wordSpacing: -0.1,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'KINGDOM OF BAHRAIN',
                style: textTheme.labelSmall?.copyWith(
                  fontSize: 8,
                  fontFamily: AppConstants.fontGotham,
                ),
              ),
              const SizedBox(height: 30),
              const MenuWidget()
            ],
          ),
        ],
      ),
      bottomSheet: const ContactBottomsheet(),
    );
  }

  // Widget menuIcons(String icon, String label) {
  //   return Row(
  //     children: [
  //       SvgPicture.asset(icon, height: 24),
  //       Text(label),
  //     ],
  //   );
  // }

  // menuIcons(double angle, {String? icon, String? label}) {
  //   final double rad = vector_math_64.radians(angle);
  //   return Transform(
  //       transform: Matrix4.identity()..translate(cos(rad), sin(rad)),
  //       child: IconButton(
  //         icon: SvgPicture.asset(icon ?? '', height: 24),
  //         onPressed: () {},
  //       ));
  // }
}
