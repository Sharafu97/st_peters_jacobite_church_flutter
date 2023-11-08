import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

class DescriptionWithTitleScreen extends StatelessWidget {
  const DescriptionWithTitleScreen({Key? key}) : super(key: key);

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
                  AppAssets.logoWatermark,
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
                    const TitleBoard(title: 'SPIRITUAL ORGANISATIONS'),
                    const SizedBox(height: 5),
                    Text(
                      'SPIRITUAL ORGANISATIONS 1',
                      style: textStyle.bodyLarge,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: screenHeight * 0.25,
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppConstants.extraLargePadding),
                      decoration: BoxDecoration(
                        color: AppColors.whiteFFFFFF,
                        border: Border.all(
                          color: AppColors.brown41210A,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.extraLargePadding),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                AppConstants.loremIpsum,
                                style: textStyle.bodyLarge,
                              ),
                              const SizedBox(
                                  height: AppConstants.defaultPadding),
                              Image.asset(
                                AppAssets.endLine,
                                scale: 2,
                              ),
                              const SizedBox(height: 90),
                            ],
                          ),
                        ),
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
