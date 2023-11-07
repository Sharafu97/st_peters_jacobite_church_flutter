import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';

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
                    Image.asset(
                      AppAssets.church,
                      width: constraints.maxWidth * 0.7,
                    ),
                    Flexible(
                      child: GridView.builder(
                        padding:
                            const EdgeInsets.all(AppConstants.defaultPadding),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // ColoredBox(
                              //     color: Colors.red,
                              //     child:
                              //         SvgPicture.asset(gridItems[index].icon)),
                              Text(
                                gridItems[index].name,
                                style: textStyle.bodySmall,
                                textAlign: TextAlign.center,
                              )
                            ],
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
