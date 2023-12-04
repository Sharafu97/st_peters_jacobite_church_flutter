import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/extensions.dart';
import 'package:st_peters_jacobite_church_flutter/model/news_event_model.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/loading_widget.dart';

import '../../../theme/color.dart';
import '../../../theme/text_theme.dart';

class NewsAndEventsDetailsWidget extends StatelessWidget {
  const NewsAndEventsDetailsWidget({super.key, required this.news});
  final NewsEvents news;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(news.newsTitle ?? '-', style: textTheme.titleLarge),
          Text((news.publishingDate ?? '-').dateFormat(),
              style: textTheme.titleMedium),
          if ((news.phots ?? []).isNotEmpty) ...[
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, AppRoutes.imageView,
                  arguments: news.phots ?? []),
              behavior: HitTestBehavior.translucent,
              child: Container(
                height: 150,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 12),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: news.phots?[0] ?? '-',
                  progressIndicatorBuilder: (context, url, progress) =>
                      const Center(
                    child: LoadingWidget(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('${news.phots?.length ?? 0} photos'),
          ],
          const SizedBox(height: 12),
          Text(
            (news.newsDetails ?? '-').parseHtmlString(),
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
