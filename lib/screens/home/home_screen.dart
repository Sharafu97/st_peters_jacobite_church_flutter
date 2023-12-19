import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/screens/home/widgets/menu_widgets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';

import '../../widgets/appbar.dart';
import '../../widgets/contact_bottombar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final _drawerKey = GlobalKey<ScaffoldState>();
  void _requestNotificationPermission() async {
    await Permission.notification.request();
  }

  @override
  void initState() {
    _requestNotificationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppbar(drawerKey: _drawerKey, showDrawer: true),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'UNDER THE HOLY APOSTOLIC SEE OF ANTIOCH & ALL THE EAST',
                  textAlign: TextAlign.center,
                  style: textTheme.labelSmall?.copyWith(
                    fontFamily: AppConstants.fontGotham,
                    letterSpacing: -0.1,
                    wordSpacing: -0.1,
                  ),
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
              const Spacer(),
              Consumer(
                builder: (context, ref, child) {
                  final data = ref.watch(authProvider);
                  return MenuWidget(state: data.state);
                },
              ),
              const Spacer(),
              const SizedBox(height: 30)
            ],
          ),
        ],
      ),
      bottomSheet: const ContactBottomBar(),
    );
  }
}
