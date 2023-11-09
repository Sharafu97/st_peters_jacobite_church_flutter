import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';

class TitleBoard extends StatelessWidget {
  const TitleBoard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SvgPicture.asset(
              AppAssets.imageNameBoard,
              colorFilter: const ColorFilter.mode(
                AppColors.brown41210A,
                BlendMode.srcIn,
              ),
              width: screenWidth * 0.8,
            ),
            Positioned(
              top: 7,
              child: Text(
                title,
                style: textStyle.bodyLarge!.copyWith(
                  color: AppColors.beigeD7CFC5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
