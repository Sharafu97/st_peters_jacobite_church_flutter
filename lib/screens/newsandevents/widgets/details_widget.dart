import 'package:flutter/material.dart';

import '../../../theme/assets.dart';
import '../../../theme/color.dart';
import '../../../theme/text_theme.dart';

class NewsAndEventsDetailsWidget extends StatelessWidget {
  const NewsAndEventsDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 10),
        decoration: BoxDecoration(
          color: AppColors.whiteFFFFFF.withOpacity(0.5),
          border: Border.all(color: AppColors.brown41210A.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text('Event name Comes here', style: textTheme.titleLarge),
            Text('25-12-2023', style: textTheme.titleMedium),
            Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 12),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                AppAssets.newsAndEventTileImage,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed justo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed justo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed justo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed justo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed justo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed justo',
                  style: textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
