import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';

class AboutChurchScreen extends StatelessWidget {
  const AboutChurchScreen({Key? key}) : super(key: key);

  static final gridItems = <GridItemData>[
    GridItemData(name: 'CHURCH HISTORY', icon: AppAssets.iconChurchWhite),
    GridItemData(name: 'OUR PATRIARCH', icon: AppAssets.iconChurchBrown),
    GridItemData(name: 'OUR CATHOLICS', icon: AppAssets.iconChurchWhite),
    GridItemData(name: 'OUR PATRIARCHAL VICAR', icon: AppAssets.iconVicarWhite),
    GridItemData(name: 'OUR BISHOPS', icon: AppAssets.iconBishops),
    GridItemData(
        name: 'FORMER PATRIARCHAL VICARS', icon: AppAssets.iconVicarWhite),
    GridItemData(name: 'FORMER VICARS', icon: AppAssets.iconVicarBrowm),
    GridItemData(name: 'FOUNDER MEMBERS', icon: AppAssets.iconFounderMembers),
    GridItemData(name: 'OLD PHOTOS', icon: AppAssets.iconOldPhotos),
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppbar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Stack(
            children: [
              Positioned(
                top: -50,
                width: constraints.maxWidth,
                child: Image.asset(
                  AppAssets.logoWatermark,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.13,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          width: constraints.maxWidth,
                          child: Center(
                            child: Image.asset(
                              AppAssets.church,
                              width: constraints.maxWidth * 0.7,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          child: SizedBox(
                            width: constraints.maxWidth,
                            child: Center(
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.nameBoard,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.brown41210A,
                                      BlendMode.srcIn,
                                    ),
                                    width: constraints.maxWidth * 0.8,
                                  ),
                                  Text(
                                    'ABOUT THE CHURCH',
                                    style: textTheme.bodyLarge!.copyWith(
                                      color: AppColors.beigeD7CFC5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Flexible(
                      child: GridView.builder(
                        padding:
                            const EdgeInsets.all(AppConstants.defaultPadding),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.1,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 10),
                                Image.asset(
                                  gridItems[index].icon,
                                  scale: 2,
                                ),
                                Text(
                                  gridItems[index].name,
                                  style: textStyle.bodySmall,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: gridItems.length,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
      bottomSheet: const ContactBottomsheet(),
    );
  }
}

class GridItemData {
  GridItemData({
    required this.name,
    required this.icon,
  });
  final String name;
  final String icon;
}
