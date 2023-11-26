import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/extensions.dart';
import 'package:st_peters_jacobite_church_flutter/model/member_details_model.dart';
import 'package:st_peters_jacobite_church_flutter/screens/members/widgets/triangle_shape.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

import '../../config/utils/enums.dart';
import '../../network/riverpod/providers.dart';
import '../../widgets/loading_widget.dart';

class MembersFamilyScreen extends ConsumerStatefulWidget {
  const MembersFamilyScreen({Key? key, required this.memberId})
      : super(key: key);

  final String memberId;

  @override
  ConsumerState<MembersFamilyScreen> createState() =>
      _MembersFamilyScreenState();
}

class _MembersFamilyScreenState extends ConsumerState<MembersFamilyScreen> {
  String dateFormatShort = 'dd MMM';
  String dateFormatLong = 'dd MMM yyyy';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        ref.read(memberProvider).getMemberDetails(widget.memberId));
    super.initState();
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
                top: screenHeight * 0.15,
                child: Image.asset(
                  AppAssets.imageLogoWatermark,
                  width: constraints.maxWidth,
                  scale: 2,
                ),
              ),
              Consumer(builder: (_, ref, __) {
                final data = ref.watch(memberProvider);
                if (data.detailsStatus == ApiStatus.LOADING) {
                  return const Center(child: LoadingWidget());
                } else if (data.detailsStatus == ApiStatus.FAILED) {
                  return Center(child: Text(data.error));
                } else if (data.detailsStatus == ApiStatus.SUCCESS) {
                  return SizedBox(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: Column(
                      children: [
                        const SizedBox(height: 55),
                        const TitleBoard(title: 'MEMBERS FAMILY'),
                        const SizedBox(height: 5),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                    height: AppConstants.largePadding),
                                _memberNameBoradWidget(data.member?.memberName,
                                    data.member?.memberJoinedOnDate, textStyle,
                                    width: constraints.maxWidth),
                                _memberAndSpouseDetails(textStyle, data.member,
                                    data.husband, data.wife),
                                ListView.separated(
                                  padding: const EdgeInsets.all(
                                      AppConstants.defaultPadding),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: data.familyDetails.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {},
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            margin: const EdgeInsets.only(
                                                right: AppConstants
                                                    .defaultPadding),
                                            decoration: BoxDecoration(
                                                color: AppColors.whiteFFFFFF,
                                                border: Border.all(
                                                  color: AppColors.brown41210A,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl: data
                                                        .familyDetails[index]
                                                        .photo ??
                                                    '',
                                                fit: BoxFit.fill,
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child: LoadingWidget()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data.familyDetails[index]
                                                        .name ??
                                                    'NILL',
                                                style: textStyle.labelLarge!
                                                    .copyWith(
                                                        color: AppColors
                                                            .black000000),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              _textWidget(
                                                  'Relation - ${data.familyDetails[index].relationship ?? 'NILL'}',
                                                  textStyle),
                                              _textWidget(
                                                  'Birthday - ${data.familyDetails[index].dateOfBirth ?? 'NILL'}',
                                                  textStyle),
                                              _textWidget(
                                                  'Residing - ${data.familyDetails[index].location ?? 'NILL'}',
                                                  textStyle),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, __) => const SizedBox(
                                    height: AppConstants.defaultPadding,
                                  ),
                                ),
                                _permenantAddressWidget(data.member, textStyle),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 45),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              })
            ],
          ),
        );
      }),
      bottomSheet: const ContactBottomsheet(),
    );
  }

  Widget _memberNameBoradWidget(String? name, String? date, TextTheme textStyle,
      {required double width}) {
    return Container(
      height: 60,
      width: width,
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
            'Joining date: ${date.dateFormat(dateFormatLong)}',
            style: textStyle.labelLarge!.copyWith(color: AppColors.black000000),
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
                name ?? '',
                style: textStyle.labelLarge!
                    .copyWith(color: AppColors.whiteFFFFFF),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _memberAndSpouseDetails(TextTheme textStyle, Member? member,
      FamilyDetails? husband, FamilyDetails? wife) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nameAndPhoto(
                textStyle,
                name: husband?.name ?? 'NILL',
                photo: husband?.photo ?? '',
              ),
              _nameAndPhoto(
                textStyle,
                name: wife?.name ?? 'NILL',
                photo: wife?.photo ?? '',
                right: true,
              ),
            ],
          ),
        ),
        _detailRow(
          textStyle,
          detail: 'BIRTHDAY',
          text1: husband?.dateOfBirth?.dateFormat(dateFormatShort),
          text2: wife?.dateOfBirth.dateFormat(dateFormatShort),
        ),
        _detailRow(
          textStyle,
          detail: 'MOBILE',
          text1: husband?.mobile,
          text2: wife?.mobile,
        ),
        _detailRow(
          textStyle,
          detail: 'BLOOD GROUP',
          text1: husband?.bloodGroup,
          text2: wife?.bloodGroup,
        ),
        _detailRow(
          textStyle,
          detail: 'EMAIL',
          text1: husband?.emailAddress,
          text2: wife?.emailAddress,
        ),
        _detailRow(
          textStyle,
          detail: 'HOME PARISH',
          text1: husband?.homeParish,
          text2: wife?.homeParish,
        ),
        _detailRow(
          textStyle,
          detail: 'OFFICE ADDRESS',
          text1: husband?.officeAddress,
          text2: wife?.officeAddress,
        ),
        _horizontalWidget(textStyle, member),
        const SizedBox(height: AppConstants.defaultPadding),
        Image.asset(
          AppAssets.imageEndLine,
          scale: 2,
        ),
        const SizedBox(height: AppConstants.defaultPadding),
      ],
    );
  }

  Widget _nameAndPhoto(TextTheme textStyle,
      {required String name, required String photo, bool right = false}) {
    return Expanded(
      child: Column(
        crossAxisAlignment:
            right ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(top: AppConstants.defaultPadding),
            decoration: BoxDecoration(
                color: AppColors.whiteFFFFFF,
                border: Border.all(color: AppColors.brown41210A),
                borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: photo,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const Center(child: LoadingWidget()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
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
    required String? text1,
    required String? text2,
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
                text1 != null && text1.isNotEmpty ? text1 : 'NILL',
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
                text2 != null && text2.isNotEmpty ? text2 : 'NILL',
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

  Widget _horizontalWidget(TextTheme textStyle, Member? member) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.largePadding),
      child: SizedBox(
          height: 30,
          child: Wrap(
            children: List.generate(
                3,
                (index) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: AppColors.brown41210A,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.extraSmallPadding,
                              vertical: 2),
                          alignment: Alignment.center,
                          child: Text(
                            index == 0
                                ? 'WEDDING DAY'
                                : index == 1
                                    ? 'AREA UNIT'
                                    : 'DIOCESE',
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
                          index == 0
                              ? member?.memberWeddingDate
                                      .dateFormat(dateFormatLong) ??
                                  'NILL'
                              : index == 1
                                  ? member?.areaUnitName ?? 'NILL'
                                  : member?.memberDiocese ?? 'NILL',
                          style: textStyle.bodyLarge!
                              .copyWith(color: AppColors.black000000),
                        )
                      ],
                    )),
          )),
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

  Widget _textWidget(String text, TextTheme textStyle) {
    return Text(
      text,
      style: textStyle.bodyMedium!.copyWith(color: AppColors.black000000),
    );
  }

  Widget _permenantAddressWidget(Member? member, TextTheme textStyle) {
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
            'Flat no: ${member?.memberFlatNo}, Building no: ${member?.memberBuildingNo}, Road:${member?.memberRoadNo}, Block:${member?.memberBlockNo}, ${member?.memberArea} ',
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
