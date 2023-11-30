import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/model/user_model.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/notifiers/auth_notifier.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/button.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/costom_snackbar.dart';

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
    return Consumer(
      builder: (context, ref, child) {
        final authData = ref.read(authProvider);
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
                margin: const EdgeInsets.only(
                    bottom: AppConstants.extraLargePadding),
                color: AppColors.brown41210A,
                child: Image.asset(AppAssets.imageTopLogos),
              ),
              if (authData.state == AuthState.authenticated)
                _userDetailsWidget(textStyle, user: UserData().user),
              if (authData.state == AuthState.unauthenticated)
                _drawerItem(
                  textStyle,
                  icon: AppAssets.drawerLogin,
                  text: 'Member Login',
                  onTap: () => Navigator.popAndPushNamed(
                      context, AppRoutes.requestOTP,
                      arguments: true),
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
              if (authData.state == AuthState.authenticated)
                _drawerItem(textStyle,
                    icon: AppAssets.drawerLogin, text: 'Logout', onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog.adaptive(
                          icon: const Icon(Icons.logout_rounded),
                          content: Text(
                            'Are you sure you want to log out?',
                            style: textStyle.bodyLarge!.copyWith(
                              fontFamily: AppConstants.fontGotham,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            CustomButton(
                              text: 'Cancel',
                              onPressed: () => Navigator.pop(context),
                            ),
                            const SizedBox.square(
                                dimension: AppConstants.smallPadding),
                            CustomTextButton(
                              text: 'Yes',
                              onPressed: () async {
                                await ref.read(authProvider).unauthenticate();
                                if (mounted) {
                                  snackBar(context,
                                      content: 'User logged out.');
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ],
                        );
                      });
                }),
            ],
          ),
        );
      },
    );
  }

  Widget _userDetailsWidget(TextTheme textStyle, {required UserModel user}) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            user.memberName ?? '-',
            style: textStyle.titleLarge!.copyWith(
              fontFamily: AppConstants.fontGotham,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppConstants.smallPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user.memberMobile ?? '-',
                style: textStyle.bodyLarge!
                    .copyWith(fontFamily: AppConstants.fontGotham),
              ),
              ColoredBox(
                color: AppColors.brown41210A,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'ID: ${user.memberCode}',
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
