import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

class AboutChurchScreen extends StatelessWidget {
  const AboutChurchScreen({Key? key}) : super(key: key);

  navigate(BuildContext context, String url) {
    Navigator.pushNamed(context, AppRoutes.webView, arguments: url);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _menuItem(
                                  textStyle,
                                  screenWidth,
                                  icon: AppAssets.churchHistory,
                                  text: 'CHURCH\nHISTORY',
                                  onTap: () {
                                    navigate(
                                        context, AppConstants.churchHistoryURL);
                                  },
                                ),
                                _menuItem(
                                  textStyle,
                                  screenWidth,
                                  icon: AppAssets.patriarch,
                                  text: 'PATRIARCH',
                                  onTap: () {
                                    navigate(
                                        context, AppConstants.partiarchURL);
                                  },
                                ),
                                _menuItem(
                                  textStyle,
                                  screenWidth,
                                  icon: AppAssets.catholics,
                                  text: 'CATHOLICOS',
                                  onTap: () {
                                    navigate(
                                        context, AppConstants.catholicosURL);
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(
                                  AppConstants.defaultPadding),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _menuItem(
                                        textStyle,
                                        screenWidth,
                                        icon: AppAssets.patriarchalVicar,
                                        text: 'PATRIARCHAL\nVICAR',
                                        onTap: () {
                                          navigate(context,
                                              AppConstants.partiarcalVicarURL);
                                        },
                                      ),
                                      const SizedBox(
                                          height: AppConstants.defaultPadding),
                                      _menuItem(
                                        textStyle,
                                        screenWidth,
                                        icon: AppAssets.formerPatriarchalVicar,
                                        text: 'FORMER\nPATRIARCHAL VICAR',
                                        onTap: () {
                                          navigate(
                                              context,
                                              AppConstants
                                                  .formarPartiarcalVicarURL);
                                        },
                                      ),
                                    ],
                                  ),
                                  Image.asset(AppAssets.seperator2, scale: 3),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _menuItem(
                                        textStyle,
                                        screenWidth,
                                        icon: AppAssets.vicar,
                                        text: 'VICAR\n',
                                        onTap: () {
                                          navigate(context,
                                              AppConstants.currentVicarURL);
                                        },
                                      ),
                                      const SizedBox(
                                          height: AppConstants.defaultPadding),
                                      _menuItem(
                                        textStyle,
                                        screenWidth,
                                        icon: AppAssets.formerVicar,
                                        text: 'FORMER\nVICAR',
                                        onTap: () {
                                          navigate(context,
                                              AppConstants.formerVicarsURL);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _menuItem(
                                  textStyle,
                                  screenWidth,
                                  icon: AppAssets.bishops,
                                  text: 'BISHOPS',
                                  onTap: () {
                                    navigate(context, AppConstants.bishopsURL);
                                  },
                                ),
                                _menuItem(
                                  textStyle,
                                  screenWidth,
                                  icon: AppAssets.founderMembers,
                                  text: 'FOUNDER\nMEMBERS',
                                  onTap: () {
                                    navigate(
                                        context, AppConstants.founderMemberURL);
                                  },
                                ),
                                _menuItem(
                                  textStyle,
                                  screenWidth,
                                  icon: AppAssets.memories,
                                  text: 'MEMORIES',
                                  onTap: () {
                                    navigate(context, AppConstants.memoriesURL);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
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

  Widget _menuItem(TextTheme textStyle, double width,
      {required String icon, required String text, void Function()? onTap}) {
    return InkWell(
        onTap: onTap,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: 10),
          Image.asset(
            icon,
            scale: 2,
            width: (width - (4 * AppConstants.defaultPadding)) / 3,
          ),
          Text(
            text,
            style: textStyle.bodySmall,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ]));
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
