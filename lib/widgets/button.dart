import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onPressed,
    this.height,
    this.width,
  });
  final String text;
  final bool isLoading;
  final void Function()? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brown41210A,
          fixedSize: Size(width ?? screenWidth, height ?? 50)),
      child: isLoading
          ? const SizedBox.square(
              dimension: 25,
              child: Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.whiteFFFFFF),
                ),
              ),
            )
          : Text(
              text,
              style: textStyle.bodyLarge!.copyWith(
                fontFamily: AppConstants.fontGotham,
                color: AppColors.whiteFFFFFF,
              ),
            ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onPressed,
    this.height,
    this.width,
  });
  final String text;
  final bool isLoading;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          fixedSize: Size(width ?? screenWidth, height ?? 50)),
      child: isLoading
          ? const SizedBox.square(
              dimension: 25,
              child: Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.brown41210A),
                ),
              ),
            )
          : Text(
              text,
              style: textStyle.bodyLarge!.copyWith(
                fontFamily: AppConstants.fontGotham,
              ),
            ),
    );
  }
}
