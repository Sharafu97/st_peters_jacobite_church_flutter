import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/model/spiritual_org_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/constants.dart';
import '../../../theme/assets.dart';
import '../../../theme/color.dart';
import '../../../widgets/loading_widget.dart';

class SpritualOrgListTile extends StatelessWidget {
  const SpritualOrgListTile(
      {super.key, required this.index, required this.org});
  final int index;
  final SpiritualOrganizations org;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 8, 30),
      decoration: BoxDecoration(
          color: AppColors.whiteFFFFFF.withOpacity(0.5),
          border: Border.all(color: AppColors.brown41210A.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              org.organizationName ?? 'NIL',
              style: textTheme.bodyMedium!
                  .copyWith(fontFamily: AppConstants.fontGotham),
            ),
          ),
          const SizedBox(height: AppConstants.smallPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              coordinatorWidget(
                  textTheme,
                  'Male',
                  org.coordinatorName1,
                  org.coordinatorDesignation1,
                  org.coordinatorPhone1,
                  org.coordinatorPhoto1),
              coordinatorWidget(
                  textTheme,
                  'Female',
                  org.coordinatorName2,
                  org.coordinatorDesignation2,
                  org.coordinatorPhone2,
                  org.coordinatorPhoto2),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            org.organizationDetails ?? 'NIL',
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget coordinatorWidget(TextTheme textTheme, String coordinator,
      String? name, String? desgnation, String? phone, String? photo) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Container(
            height: 100,
            width: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: AppColors.whiteFFFFFF,
                border: Border.all(color: AppColors.brown41210A),
                borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: photo ?? '',
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const Center(child: LoadingWidget()),
                errorWidget: (context, url, error) => Image.asset(
                    coordinator == 'Male'
                        ? AppAssets.maleAvtar
                        : AppAssets.fenaleAvtar),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name ?? 'NIL',
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall!
                .copyWith(fontFamily: AppConstants.fontGotham),
          ),
          Text(
            desgnation ?? 'NIL',
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall!
                .copyWith(fontFamily: AppConstants.fontGotham),
          ),
          const SizedBox(height: 6),
          InkWell(
            onTap: () => launchUrl(Uri(scheme: 'tel', path: phone)),
            child: Row(
              children: [
                Image.asset(AppAssets.iconCall,
                    height: 18, color: AppColors.brown41210A),
                const SizedBox(width: 4),
                Text(
                  phone ?? 'NIL',
                  style: textTheme.bodySmall!
                      .copyWith(fontFamily: AppConstants.fontGotham),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
