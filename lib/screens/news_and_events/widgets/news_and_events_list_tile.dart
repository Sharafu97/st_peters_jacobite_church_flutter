import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/extensions.dart';
import 'package:st_peters_jacobite_church_flutter/model/news_event_model.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/loading_widget.dart';

class NewsAndEventsListTile extends StatelessWidget {
  const NewsAndEventsListTile({super.key, required this.news});
  final NewsEvents news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.newsAndEventsDetails,
            arguments: news);
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
              news.phots?.isNotEmpty ?? false
                  ? Container(
                      height: 120,
                      width: 120,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: AppColors.whiteFFFFFF.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: news.phots?.first ?? '-',
                        progressIndicatorBuilder: (context, url, progress) =>
                            const Center(
                          child: LoadingWidget(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(news.newsTitle ?? '-',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.labelLarge),
                      Text(
                        (news.newsDetails ?? '-').parseHtmlString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text((news.publishingDate ?? '-').dateFormat(),
                          style: textTheme.labelLarge),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
