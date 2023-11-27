import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/model/areaunits_model.dart';

import '../../../theme/color.dart';
import '../../../widgets/loading_widget.dart';

class AreaUnitsListTile extends StatelessWidget {
  const AreaUnitsListTile(
      {super.key, required this.index, required this.areaUnit});
  final int index;
  final AreaUnits areaUnit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 30),
      decoration: BoxDecoration(
          color: AppColors.whiteFFFFFF.withOpacity(0.5),
          border: Border.all(color: AppColors.brown41210A.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1})',
            style: textTheme.bodyLarge!
                .copyWith(fontFamily: AppConstants.fontGotham),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  areaUnit.areaName ?? 'NILL',
                  style: textTheme.bodyLarge!
                      .copyWith(fontFamily: AppConstants.fontGotham),
                ),
                const SizedBox(height: 4),
                Container(
                  color: AppColors.brown41210A,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.smallPadding,
                    vertical: 5,
                  ),
                  child: Text(
                    'Meeting Day: ${areaUnit.meetingDay ?? 'NILL'}',
                    style: textTheme.bodySmall!.copyWith(
                        fontFamily: AppConstants.fontGotham,
                        color: AppColors.whiteFFFFFF),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  areaUnit.areaUnits ?? 'NILL',
                  style: textTheme.bodySmall!
                      .copyWith(fontFamily: AppConstants.fontGotham),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Male Coordinator',
                        style: textTheme.bodyMedium!
                            .copyWith(fontFamily: AppConstants.fontGotham),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Female Coordinator',
                        style: textTheme.bodyMedium!
                            .copyWith(fontFamily: AppConstants.fontGotham),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    coordinatorWidget(
                        textTheme,
                        'Male Coordinator',
                        areaUnit.maleCoordinatorName,
                        areaUnit.maleCoordinatorPhone,
                        areaUnit.maleCoordinatorPhoto),
                    coordinatorWidget(
                        textTheme,
                        'Female Coordinator',
                        areaUnit.femaleCoordinatorName,
                        areaUnit.femaleCoordinatorPhone,
                        areaUnit.femaleCoordinatorPhoto),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget coordinatorWidget(TextTheme textTheme, String coordinator,
      String? name, String? phone, String? photo) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Container(
            height: 120,
            width: 120,
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Name: ${name ?? 'NILL'} ',
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall!
                .copyWith(fontFamily: AppConstants.fontGotham),
          ),
          Text(
            'Contact: ${phone ?? 'NILL'}',
            style: textTheme.bodySmall!
                .copyWith(fontFamily: AppConstants.fontGotham),
          ),
        ],
      ),
    );
  }
}
