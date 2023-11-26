import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.isCenterAligned = false,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
  });
  final TextEditingController controller;
  final bool isCenterAligned;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return TextFormField(
      controller: controller,
      textAlign: isCenterAligned ? TextAlign.center : TextAlign.start,
      maxLines: 1,
      validator: validator,
      keyboardType: keyboardType,
      style: textStyle.titleLarge!.copyWith(
        fontFamily: AppConstants.fontGotham,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        fillColor: AppColors.whiteFFFFFF,
        filled: true,
        hintText: hintText,
        hintStyle: textStyle.bodyLarge!.copyWith(
            fontFamily: AppConstants.fontGotham,
            color: AppColors.brown41210A.withOpacity(0.7)),
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
    );
  }
}
