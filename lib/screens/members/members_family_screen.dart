import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

class MembersFamilyScreen extends StatelessWidget {
  const MembersFamilyScreen({Key? key}) : super(key: key);

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
                    const TitleBoard(title: 'MEMBERS FAMILY'),
                    const SizedBox(height: 5),
                    Flexible(
                      child: ListView.separated(
                        padding:
                            const EdgeInsets.all(AppConstants.defaultPadding),
                        itemBuilder: (context, index) {
                          return InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                    Text(
                                      'MERIN BAIJU',
                                      style: textStyle.labelLarge!.copyWith(
                                          color: AppColors.black000000),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    _textWidget(
                                        'Relation - Daughter', textStyle),
                                    _textWidget('Birthday - 20 Dec', textStyle),
                                    _textWidget(
                                        'Residing - Baharain', textStyle),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(
                          height: AppConstants.defaultPadding,
                        ),
                        itemCount: 6,
                      ),
                    ),
                    Container(
                      color: AppColors.brown41210A,
                      margin: const EdgeInsets.only(
                          top: AppConstants.extraSmallPadding),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.smallPadding,
                        vertical: AppConstants.extraSmallPadding,
                      ),
                      child: Text(
                        'PERMENENT ADDRESS',
                        style: textStyle.labelLarge!
                            .copyWith(color: AppColors.whiteFFFFFF),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: AppConstants.smallPadding),
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                        style: textStyle.bodyLarge!.copyWith(
                          color: AppColors.black000000,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 60),
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

  Widget _textWidget(String text, TextTheme textStyle) {
    return Text(
      text,
      style: textStyle.bodyMedium!.copyWith(color: AppColors.black000000),
    );
  }
}
