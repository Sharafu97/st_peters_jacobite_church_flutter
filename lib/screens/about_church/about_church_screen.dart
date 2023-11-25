import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

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

  navigate(BuildContext context, String url) {
    Navigator.pushNamed(context, AppRoutes.webView, arguments: url);
  }

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
                  AppAssets.imageLogoWatermark,
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
                              AppAssets.imageChurch,
                              width: constraints.maxWidth * 0.7,
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: -20,
                          child: TitleBoard(
                            title: 'ABOUT THE CHURCH',
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
                            onTap: () {
                              switch (index) {
                                case 0:
                                  navigate(
                                      context, AppConstants.churchHistoryURL);
                                  break;
                                case 1:
                                  navigate(context, AppConstants.partiarchURL);
                                  break;
                                case 2:
                                  navigate(context, AppConstants.catholicosURL);
                                  break;
                                case 3:
                                  navigate(
                                      context, AppConstants.partiarcalVicarURL);
                                  break;
                                case 4:
                                  navigate(context, AppConstants.bishopsURL);
                                  break;
                                case 5:
                                  navigate(context,
                                      AppConstants.formarPartiarcalVicarURL);
                                  break;
                                case 6:
                                  navigate(
                                      context, AppConstants.formerVicarsURL);
                                  break;
                                case 7:
                                  navigate(
                                      context, AppConstants.founderMemberURL);
                                  break;
                                case 8:
                                  Navigator.pushNamed(context,
                                      AppRoutes.spiritualOrganisations);
                                  break;
                              }
                            },
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
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
