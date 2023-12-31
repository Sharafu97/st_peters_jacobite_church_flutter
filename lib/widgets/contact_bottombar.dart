import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactBottomBar extends StatelessWidget {
  const ContactBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final textStyle = Theme.of(context).textTheme;
    return Container(
        height: 45,
        color: AppColors.brown41210A,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () => Navigator.pushNamed(context, AppRoutes.webView,
                    arguments: AppConstants.CHURCHPRAYARFORM),
                child: Image.asset(AppAssets.iconPrayer,
                    color: AppColors.whiteFFFFFF)),
            const SizedBox(width: 8),
            InkWell(
                onTap: () => launchUrl(
                    Uri(scheme: 'tel', path: AppConstants.CHURCHPHONE)),
                child: Image.asset(AppAssets.iconCall)),
            const SizedBox(width: 8),
            InkWell(
                onTap: () => launchUrl(
                    Uri(scheme: 'mailto', path: AppConstants.CHURCHMAIL)),
                child: Image.asset(AppAssets.iconMessage)),
            const SizedBox(width: 8),
            InkWell(
                onTap: () => launchUrlString(AppConstants.CHURCHWEBSITE),
                child: Image.asset(AppAssets.iconWeb,
                    color: AppColors.whiteFFFFFF)),
            const SizedBox(width: 8),
            InkWell(
                onTap: () => launchUrlString(AppConstants.CHURCHLOCATION),
                child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5, color: AppColors.whiteFFFFFF),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.location_on_sharp,
                      color: AppColors.whiteFFFFFF,
                    ))),
            // const SizedBox(width: 5),
            // Text(
            //   'CONTACT US',
            //   style: textStyle.titleLarge!.copyWith(
            //     color: AppColors.whiteFFFFFF,
            //     fontFamily: AppConstants.fontRikon,
            //   ),
            // )
          ],
        ));
  }
}
