import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';

class ContactBottomsheet extends StatelessWidget {
  const ContactBottomsheet({Key? key, this.showContact = true})
      : super(key: key);

  final bool showContact;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      height: showContact ? 45 : 30,
      color: AppColors.brown41210A,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: showContact
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.iconCall),
                const SizedBox(width: 5),
                Image.asset(AppAssets.iconMessage),
                const SizedBox(width: 5),
                Text(
                  'CONTACT US',
                  style: textStyle.titleLarge!.copyWith(
                    color: AppColors.whiteFFFFFF,
                    fontFamily: AppConstants.fontRikon,
                  ),
                )
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
