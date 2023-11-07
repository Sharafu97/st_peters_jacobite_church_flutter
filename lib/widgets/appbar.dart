import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).viewPadding.top;
    return AppBar(
      backgroundColor: AppColors.transparent,
      leading: const SizedBox.shrink(),
      flexibleSpace: Container(
        clipBehavior: Clip.none,
        color: AppColors.brown41210A,
        width: screenSize.width,
        height: 50 + topPadding,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: topPadding,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.menu_rounded,
                      color: AppColors.whiteFFFFFF,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                left: 1,
                right: 1,
                bottom: -35,
                child: Image.asset(
                  AppAssets.topLogos,
                  height: 70,
                ))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
