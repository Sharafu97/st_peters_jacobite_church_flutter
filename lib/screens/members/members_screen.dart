import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/loading_widget.dart';

class MembersScreen extends ConsumerStatefulWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends ConsumerState<MembersScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(memberProvider).getMembers();
    });
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
              SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Column(
                  children: [
                    const SizedBox(height: 55),
                    const TitleBoard(title: 'MEMBERS'),
                    const SizedBox(height: 5),
                    Flexible(
                      child: Consumer(builder: (_, ref, __) {
                        final dataRef = ref.watch(memberProvider);

                        if (dataRef.status == ApiStatus.SUCCESS) {
                          return ListView.separated(
                            padding: const EdgeInsets.all(
                                AppConstants.defaultPadding),
                            itemCount: dataRef.members.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () => Navigator.pushNamed(
                                    context, AppRoutes.memberFamily),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      margin: const EdgeInsets.only(
                                          right: AppConstants.defaultPadding),
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteFFFFFF,
                                        border: Border.all(
                                            color: AppColors.brown41210A),
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(35),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              dataRef.members[index].photo ??
                                                  '',
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                              const LoadingWidget(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dataRef.members[index].memberName ??
                                                '',
                                            style: textStyle.labelLarge!
                                                .copyWith(
                                                    color:
                                                        AppColors.black000000),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            'ID: ${dataRef.members[index].memberCode}',
                                            style: textStyle.bodyMedium!
                                                .copyWith(
                                                    color:
                                                        AppColors.black000000),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () => launchUrl(Uri(
                                        scheme: 'tel',
                                        path:
                                            dataRef.members[index].memberMobile,
                                      )),
                                      child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(
                                          AppAssets.iconCall,
                                          color: AppColors.brown41210A,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (_, __) => const SizedBox(
                              height: AppConstants.defaultPadding,
                            ),
                          );
                        } else if (dataRef.status == ApiStatus.LOADING) {
                          return const Center(child: LoadingWidget());
                        } else {
                          return Center(
                            child: Text(dataRef.error),
                          );
                        }
                      }),
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
