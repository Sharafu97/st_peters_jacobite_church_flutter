import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/model/committee_model.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottombar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/loading_widget.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

class ChurchOfficialsScreen extends ConsumerStatefulWidget {
  const ChurchOfficialsScreen({super.key});

  @override
  ConsumerState<ChurchOfficialsScreen> createState() =>
      _ChurchOfficialsScreenState();
}

class _ChurchOfficialsScreenState extends ConsumerState<ChurchOfficialsScreen> {
  static final _drawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(committeeProvider).getCommittee();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppbar(drawerKey: _drawerKey),
      drawer: const SideDrawer(),
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
                child: Consumer(builder: (_, ref, __) {
                  final data = ref.watch(committeeProvider);
                  if (data.status == ApiStatus.LOADING) {
                    return const Center(child: LoadingWidget());
                  } else if (data.status == ApiStatus.SUCCESS) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 55),
                          const TitleBoard(title: 'CHURCH OFFICIALS'),
                          const SizedBox(height: 5),
                          _presidentWidget(
                            textStyle,
                            screenWidth: screenWidth,
                            member: data.predident,
                          ),
                          const SizedBox(height: AppConstants.defaultPadding),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: AppConstants.defaultPadding,
                            runSpacing: AppConstants.defaultPadding,
                            children: List.generate(
                              data.coreCommittee.length,
                              (index) => _committeeMemberWidget(
                                textStyle,
                                width: (screenWidth -
                                        (4 * AppConstants.defaultPadding)) /
                                    3,
                                member: data.coreCommittee[index],
                              ),
                            ),
                          ),
                          const SizedBox(
                              height: AppConstants.extraLargePadding),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: AppConstants.defaultPadding,
                            runSpacing: AppConstants.defaultPadding,
                            children: List.generate(
                              data.committeeMembers.length,
                              (index) => _committeeMemberWidget(
                                textStyle,
                                width: (screenWidth -
                                        (5 * AppConstants.defaultPadding)) /
                                    3,
                                member: data.committeeMembers[index],
                              ),
                            ),
                          ),
                          const Divider(
                            color: AppColors.brown41210A,
                            indent: AppConstants.defaultPadding,
                            endIndent: AppConstants.defaultPadding,
                            height: 2 * AppConstants.extraLargePadding,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: AppConstants.defaultPadding,
                            runSpacing: AppConstants.defaultPadding,
                            children: List.generate(
                              data.auditors.length,
                              (index) => _committeeMemberWidget(
                                textStyle,
                                width: (screenWidth -
                                        (6 * AppConstants.defaultPadding)) /
                                    3,
                                member: data.auditors[index],
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    );
                  } else if (data.status == ApiStatus.FAILED) {
                    return Center(
                      child: Text(data.error),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              )
            ],
          ),
        );
      }),
      bottomSheet: const ContactBottomBar(),
    );
  }

  Widget _cachedImage(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, progress) => const Center(
        child: LoadingWidget(),
      ),
      fit: BoxFit.cover,
    );
  }

  Widget _presidentWidget(
    TextTheme textStyle, {
    required double screenWidth,
    required CommitteeMember member,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Navigator.pushNamed(context, AppRoutes.webView,
          arguments: AppConstants.currentVicarURL),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            member.designation ?? '-',
            style: textStyle.bodyMedium!.copyWith(
              fontFamily: AppConstants.fontGotham,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: AppConstants.extraSmallPadding),
          Container(
            width: screenWidth / 2.8,
            decoration:
                BoxDecoration(border: Border.all(color: AppColors.brown41210A)),
            child: _cachedImage(member.photo ?? ''),
          ),
          const Divider(
            color: AppColors.brown41210A,
            height: 0,
            indent: AppConstants.defaultPadding,
            endIndent: AppConstants.defaultPadding,
          ),
          const SizedBox(height: AppConstants.extraSmallPadding),
          Text(
            (member.personName ?? '-').toUpperCase(),
            style: textStyle.bodyLarge!.copyWith(
              fontFamily: AppConstants.fontGotham,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _committeeMemberWidget(
    TextTheme textStyle, {
    required double width,
    required CommitteeMember member,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Navigator.pushNamed(context, AppRoutes.memberFamily,
          arguments: member.memberId),
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              member.designation ?? '-',
              style: textStyle.bodyMedium!.copyWith(
                fontFamily: AppConstants.fontGotham,
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: width,
                  height: width * 1.2,
                  margin: const EdgeInsets.symmetric(
                      vertical: AppConstants.extraSmallPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.brown41210A),
                  ),
                  child: _cachedImage(member.photo ?? '-'),
                ),
                Positioned(
                  bottom: AppConstants.extraSmallPadding,
                  left: -6,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.yellowFBAF43,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    child: Text(
                      member.memberId ?? '-',
                      style: textStyle.bodySmall!.copyWith(
                        fontFamily: AppConstants.fontGotham,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Text(
              (member.personName ?? '-').toUpperCase(),
              style: textStyle.bodyMedium!.copyWith(
                fontFamily: AppConstants.fontGotham,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
