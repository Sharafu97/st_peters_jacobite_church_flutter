import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';

snackBar(BuildContext context, {String content = '', int seconds = 4}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: seconds),
      backgroundColor: AppColors.brown41210A,
    ),
  );
}
