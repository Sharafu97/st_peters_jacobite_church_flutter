import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/screens/home/widgets/menu_widgets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';

import '../../widgets/appbar.dart';
import '../../widgets/contact_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppbar(drawerKey: _drawerKey),
      drawer: const SideDrawer(),
      body: Stack(
        children: [
          Positioned(
            right: -30,
            top: 30,
            child: Image.asset(AppAssets.imageLogoWatermark, scale: 3),
          ),
          Positioned(
            right: 0,
            bottom: 45,
            child: Image.asset(AppAssets.imageChurch, scale: 4),
          ),
          Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding),
                child: FittedBox(
                  child: Text(
                    "St. Peter's Jacobite Syrian Orthodox Church",
                    style: textTheme.titleLarge?.copyWith(
                      fontFamily: AppConstants.fontGregorian,
                      color: AppColors.redDD2127,
                    ),
                  ),
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
              Consumer(
                builder: (context, ref, child) {
                  final data = ref.watch(authProvider);
                  return MenuWidget(state: data.state);
                },
              )
            ],
          ),
        ],
      ),
      bottomSheet: const ContactBottomsheet(),
    );
  }
}
