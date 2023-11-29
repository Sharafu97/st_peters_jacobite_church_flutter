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
  void _navigate(String url) {
    Navigator.pushNamed(context, AppRoutes.webView, arguments: url);
  }

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
          _userDetailsWidget(textStyle),
          _drawerItem(
            textStyle,
            icon: AppAssets.drawerLogin,
            text: 'Member Login',
            onTap: () => Navigator.pushNamed(context, AppRoutes.requestOTP),
          ),
          _drawerItem(
            textStyle,
            icon: AppAssets.drawerTerms,
            text: 'Terms of Use',
            onTap: () => _navigate(AppConstants.termsOfUseURL),
          ),
          _drawerItem(
            textStyle,
            icon: AppAssets.drawerPrivacyPolicy,
            text: 'Privacy Policy',
            onTap: () => _navigate(AppConstants.privacyPolicyURL),
          ),
          _drawerItem(
            textStyle,
            icon: AppAssets.drawerCopyright,
            text: 'Copyrights',
            onTap: () => _navigate(AppConstants.copyrightURL),
          ),
          _drawerItem(
            textStyle,
            icon: AppAssets.drawerAbout,
            text: 'About',
            onTap: () => _navigate(AppConstants.aboutURL),
          ),
          _drawerItem(
            textStyle,
            icon: AppAssets.drawerContact,
            text: 'Contact Us',
            onTap: () => _navigate(AppConstants.contactURL),
          ),
          _drawerItem(textStyle, icon: AppAssets.drawerLogin, text: 'Logout')
        ],
      ),
    );
  }

  Widget _userDetailsWidget(TextTheme textStyle) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Name Goes Here And Here Also',
            style: textStyle.titleLarge!
                .copyWith(fontFamily: AppConstants.fontGotham),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppConstants.smallPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '987654321',
                style: textStyle.bodyLarge!
                    .copyWith(fontFamily: AppConstants.fontGotham),
              ),
              ColoredBox(
                color: AppColors.brown41210A,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'ID: 543',
                    style: textStyle.bodyLarge!.copyWith(
                      fontFamily: AppConstants.fontGotham,
                      color: AppColors.yellowCFB68A,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: AppConstants.largePadding,
          )
        ],
      ),
    );
  }

  Widget _drawerItem(
    TextTheme textStyle, {
    String? icon,
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
            if (icon != null) ...[
              Image.asset(
                icon,
                scale: 2,
                height: 25,
              ),
              const SizedBox(width: AppConstants.defaultPadding),
            ],
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
