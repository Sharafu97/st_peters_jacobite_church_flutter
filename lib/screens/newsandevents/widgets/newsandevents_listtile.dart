import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';

import '../../../theme/assets.dart';

class NewsAndEventsListTile extends StatelessWidget {
  NewsAndEventsListTile({super.key});

  final timeStyle = textTheme.bodyLarge?.copyWith();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 50, 10),
        decoration: BoxDecoration(
            color: AppColors.whiteFFFFFF.withOpacity(0.5),
            border: Border.all(color: AppColors.brown41210A.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColors.whiteFFFFFF.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                AppAssets.newsAndEventTileImage,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Event name Comes here'),
                Expanded(
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed justo'),
                ),
                Text('Event name Comes here'),
              ],
            )
          ],
        ));
  }
}
