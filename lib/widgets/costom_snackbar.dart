import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';

snackBar(BuildContext context, {String content = '', int seconds = 3}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: AppConstants.fontGotham,
            ),
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: seconds),
      backgroundColor: AppColors.yellowCFB68A,
    ),
  );
}
