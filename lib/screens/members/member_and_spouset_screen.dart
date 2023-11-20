import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/screens/members/widgets/triangle_shape.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';

class MemberAndSpousetScreen extends StatelessWidget {
  const MemberAndSpousetScreen({Key? key}) : super(key: key);

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
                    const SizedBox(height: 75),
                    Container(
                      height: 60,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.beigeD7CFC5,
                            AppColors.whiteFFFFFF.withOpacity(0.7),
                            AppColors.beigeD7CFC5
                          ],
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Text(
                            'Joining date: 20 Jan 1995',
                            style: textStyle.labelLarge!
                                .copyWith(color: AppColors.black000000),
                          ),
                          Positioned(
                            top: -20,
                            child: Container(
                              color: AppColors.brown41210A,
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.smallPadding,
                                vertical: 5,
                              ),
                              child: Text(
                                ' BAIJU P.M',
                                style: textStyle.labelLarge!
                                    .copyWith(color: AppColors.whiteFFFFFF),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppConstants.defaultPadding),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _nameAndPhoto(
                                    textStyle,
                                    name: 'BAIJU P.M',
                                  ),
                                  _nameAndPhoto(
                                    textStyle,
                                    name: 'DIVYA VARGHESE',
                                    right: true,
                                  ),
                                ],
                              ),
                            ),
                            _detailRow(
                              textStyle,
                              detail: 'BIRTHDAY',
                              text1: '23 Sep',
                              text2: '23 Sep',
                            ),
                            _detailRow(
                              textStyle,
                              detail: 'MOBILE',
                              text1: '+973 3904 7793',
                              text2: '+973 3904 7793',
                            ),
                            _detailRow(
                              textStyle,
                              detail: 'BLOOD GROUP',
                              text1: 'O+',
                              text2: 'O+',
                            ),
                            _detailRow(
                              textStyle,
                              detail: 'EMAIL',
                              text1: 'pynadathbaiju.com',
                              text2: 'pynadathbaiju.com',
                            ),
                            _detailRow(
                              textStyle,
                              detail: 'HOME PARISH',
                              text1:
                                  'St Thomas karmelkunnu Cathedral, Vettickal, Kerala',
                              text2:
                                  'St Thomas karmelkunnu Cathedral, Vettickal, Kerala',
                            ),
                            _detailRow(
                              textStyle,
                              detail: 'OFFICE ADDRESS',
                              text1: 'Udrive Rent A Car Seef, Bahrain',
                              text2: 'Udrive Rent A Car Seef, Bahrain',
                            ),
                            _horizontalWidget(textStyle),
                            _address(
                              textStyle,
                              address:
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                            ),
                            const SizedBox(height: AppConstants.defaultPadding),
                            Image.asset(
                              AppAssets.imageEndLine,
                              scale: 2,
                            ),
                            const SizedBox(height: AppConstants.defaultPadding),
                          ],
                        ),
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

  Widget _nameAndPhoto(TextTheme textStyle,
      {required String name, bool right = false}) {
    return Expanded(
      child: Column(
        crossAxisAlignment:
            right ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            margin: const EdgeInsets.only(top: AppConstants.defaultPadding),
            decoration: BoxDecoration(
                color: AppColors.whiteFFFFFF,
                border: Border.all(
                  color: AppColors.brown41210A,
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(
            height: AppConstants.smallPadding,
          ),
          Text(
            name,
            style: textStyle.labelLarge!.copyWith(color: AppColors.black000000),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _detailRow(
    TextTheme textStyle, {
    required String detail,
    required String text1,
    required String text2,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.extraSmallPadding,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.extraSmallPadding, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.brown41210A),
              ),
              alignment: Alignment.center,
              child: Text(
                text1,
                style: textStyle.bodyMedium!.copyWith(
                  color: AppColors.black000000,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.extraSmallPadding, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.brown41210A),
                color: AppColors.brown41210A,
              ),
              alignment: Alignment.center,
              child: Text(
                detail,
                style: textStyle.bodyMedium!
                    .copyWith(color: AppColors.whiteFFFFFF),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.extraSmallPadding, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.brown41210A),
              ),
              alignment: Alignment.center,
              child: Text(
                text2,
                style: textStyle.bodyMedium!.copyWith(
                  color: AppColors.black000000,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _horizontalWidget(TextTheme textStyle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.largePadding),
      child: SizedBox(
        height: 30,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  color: AppColors.brown41210A,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.extraSmallPadding, vertical: 2),
                  alignment: Alignment.center,
                  child: Text(
                    'WEDDING DAY',
                    style: textStyle.bodyLarge!
                        .copyWith(color: AppColors.whiteFFFFFF),
                  ),
                ),
                const TriangleShape(
                  color: AppColors.brown41210A,
                  size: Size(10, 30),
                ),
                const SizedBox(width: AppConstants.smallPadding),
                Text(
                  '20 Jan 1995',
                  style: textStyle.bodyLarge!
                      .copyWith(color: AppColors.black000000),
                )
              ],
            );
          },
          separatorBuilder: (_, __) =>
              const SizedBox(width: AppConstants.smallPadding),
          itemCount: 4,
        ),
      ),
    );
  }

  Widget _address(TextTheme textStyle, {required String address}) {
    return Column(
      children: [
        Container(
          color: AppColors.brown41210A,
          margin: const EdgeInsets.only(top: AppConstants.extraSmallPadding),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.smallPadding,
            vertical: AppConstants.extraSmallPadding,
          ),
          child: Text(
            'PERMENENT ADDRESS',
            style: textStyle.labelLarge!.copyWith(color: AppColors.whiteFFFFFF),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 60, vertical: AppConstants.smallPadding),
          child: Text(
            address,
            style: textStyle.bodyLarge!.copyWith(
              color: AppColors.black000000,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
