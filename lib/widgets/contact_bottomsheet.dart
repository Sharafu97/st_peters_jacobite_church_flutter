import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';

class ContactBottomsheet extends StatelessWidget {
  const ContactBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      height: 45,
      color: AppColors.brown41210A,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TODO:Change Icons
          const Icon(
            Icons.call_rounded,
            color: AppColors.whiteFFFFFF,
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.mail_outline_rounded,
            color: AppColors.whiteFFFFFF,
          ),
          const SizedBox(width: 5),
          Text(
            'CONTACT US',
            style: textStyle.titleLarge!.copyWith(
              color: AppColors.whiteFFFFFF,
              fontFamily: AppConstants.fontRikon,
            ),
          )
        ],
      ),
    );
  }
}
