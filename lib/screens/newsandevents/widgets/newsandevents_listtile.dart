import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';

import '../../../theme/assets.dart';

class NewsAndEventsListTile extends StatelessWidget {
  const NewsAndEventsListTile({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        Navigator.pushNamed(context, AppRoutes.newsAndEventsDetails);
      },
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.whiteFFFFFF.withOpacity(0.5),
              border: Border.all(color: AppColors.brown41210A.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 120,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: AppColors.whiteFFFFFF.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  AppAssets.imageNewsAndEventTileImage,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Event name Comes here',
                          style: textTheme.labelLarge),
                      const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed justo '),
                      const Spacer(),
                      Text('25-12-2023', style: textTheme.labelLarge),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
