import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

class AreaUnitsScreen extends StatelessWidget {
  const AreaUnitsScreen({Key? key}) : super(key: key);

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
                top: screenHeight * 0.15,
                child: Image.asset(
                  AppAssets.imageLogoWatermark,
                  width: constraints.maxWidth,
                  scale: 2,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Column(
                  children: [
                    const SizedBox(height: 55),
                    const TitleBoard(title: 'AREA UNITS'),
                    const SizedBox(height: 5),
                    Flexible(
                      child: ListView.separated(
                        padding:
                            const EdgeInsets.all(AppConstants.defaultPadding),
                        itemBuilder: (context, index) {
                          return InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () => Navigator.pushNamed(
                                context, AppRoutes.descriptionWithTitle),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  margin: const EdgeInsets.only(
                                      right: AppConstants.defaultPadding),
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteFFFFFF,
                                      border: Border.all(
                                        color: AppColors.brown41210A,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                        height: AppConstants.defaultPadding),
                                    Text(
                                      'AREA UNIT ${index + 1}',
                                      style: textStyle.labelLarge!.copyWith(
                                          color: AppColors.black000000),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Place',
                                      style: textStyle.bodyMedium!.copyWith(
                                          color: AppColors.black000000),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(
                          height: AppConstants.defaultPadding,
                        ),
                        itemCount: 20,
                      ),
                    ),
                    const SizedBox(height: 45),
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
