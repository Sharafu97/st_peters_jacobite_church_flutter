import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Drawer(
      backgroundColor: AppColors.yellowCFB68A,
      child: Column(
        children: [
          ColoredBox(
            color: AppColors.brown41210A,
            child: SizedBox(
              height: MediaQuery.of(context).padding.top,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.extraLargePadding,
                vertical: AppConstants.largePadding),
            margin:
                const EdgeInsets.only(bottom: AppConstants.extraLargePadding),
            color: AppColors.brown41210A,
            child: Image.asset(AppAssets.imageTopLogos),
          ),
          _drawerItem(
            textStyle,
            icon: AppAssets.drawerLogin,
            text: 'Member Login',
            onTap: () => Navigator.pushNamed(context, AppRoutes.requestOTP),
          ),
          _drawerItem(textStyle,
              icon: AppAssets.drawerTerms, text: 'Terms of Use'),
          _drawerItem(textStyle,
              icon: AppAssets.drawerPrivacyPolicy, text: 'Privacy Policy'),
          _drawerItem(textStyle,
              icon: AppAssets.drawerCopyright, text: 'Copyrights'),
          _drawerItem(textStyle, icon: AppAssets.drawerAbout, text: 'About'),
          _drawerItem(textStyle,
              icon: AppAssets.drawerContact, text: 'Contact Us'),
        ],
      ),
    );
  }

  Widget _drawerItem(
    TextTheme textStyle, {
    required String icon,
    required String text,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
            vertical: AppConstants.smallPadding),
        child: Row(
          children: [
            Image.asset(
              icon,
              scale: 2,
              height: 25,
            ),
            const SizedBox(width: AppConstants.defaultPadding),
            Text(
              text,
              style: textStyle.bodyLarge!.copyWith(
                fontFamily: AppConstants.fontGotham,
              ),
            )
          ],
        ),
      ),
    );
  }
}
