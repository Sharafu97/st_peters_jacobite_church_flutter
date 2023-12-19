import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.drawerKey,
    this.showDrawer = false,
  });

  final GlobalKey<ScaffoldState>? drawerKey;
  final bool showDrawer;

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
              left: 1,
              right: 1,
              bottom: -35,
              child: Image.asset(
                AppAssets.imageTopLogos,
                height: 70,
              ),
            ),
            Positioned(
              top: topPadding,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {
                    if (showDrawer) {
                      drawerKey!.currentState!.openDrawer();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      showDrawer
                          ? Icons.menu_rounded
                          : Icons.arrow_back_ios_rounded,
                      color: AppColors.whiteFFFFFF,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
