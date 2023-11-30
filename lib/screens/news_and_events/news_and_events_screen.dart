import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/loading_widget.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

import '../../config/constants.dart';
import '../../theme/text_theme.dart';
import '../../widgets/contact_bottomsheet.dart';
import 'widgets/news_and_events_list_tile.dart';

class NewsAndEventsScreen extends ConsumerStatefulWidget {
  const NewsAndEventsScreen({super.key});

  @override
  ConsumerState<NewsAndEventsScreen> createState() =>
      _NewsAndEventsScreenState();
}

class _NewsAndEventsScreenState extends ConsumerState<NewsAndEventsScreen> {
  static final _drawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(newsEventsProvider).getNewsAndEvents();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppbar(drawerKey: _drawerKey),
      drawer: const SideDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imageLogoWatermark),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 55),
            const TitleBoard(title: 'NEWS & EVENTS'),
            Consumer(
              builder: (_, ref, __) {
                final data = ref.watch(newsEventsProvider);
                if (data.status == ApiStatus.SUCCESS) {
                  return Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 30, top: 30),
                          child: Text(
                            'Top News',
                            style: textTheme.bodyMedium!
                                .copyWith(fontFamily: AppConstants.fontGotham),
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          itemCount: data.topNews.length,
                          separatorBuilder: (context, index) {
                            return Image.asset(AppAssets.imageSeperator,
                                scale: 4);
                          },
                          itemBuilder: (context, index) {
                            return NewsAndEventsListTile(
                                news: data.topNews[index]);
                          },
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Text(
                            'News, Events and Announcement',
                            style: textTheme.bodyMedium!
                                .copyWith(fontFamily: AppConstants.fontGotham),
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          itemCount: data.news.length,
                          separatorBuilder: (context, index) {
                            return Image.asset(AppAssets.imageSeperator,
                                scale: 4);
                          },
                          itemBuilder: (context, index) {
                            return NewsAndEventsListTile(
                                news: data.news[index]);
                          },
                        ),
                      ],
                    ),
                  );
                } else if (data.status == ApiStatus.LOADING) {
                  return const Expanded(child: Center(child: LoadingWidget()));
                } else {
                  return Expanded(
                    child: Center(
                      child: Text(data.error),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
      bottomSheet: const ContactBottomsheet(),
    );
  }
}
