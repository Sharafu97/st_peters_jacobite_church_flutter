import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/model/news_event_model.dart';
import 'package:st_peters_jacobite_church_flutter/screens/news_and_events/widgets/details_widget.dart';

import '../../theme/assets.dart';
import '../../widgets/appbar.dart';
import '../../widgets/contact_bottomsheet.dart';
import '../../widgets/title_board.dart';

class NewsAndEventsDetailsScreen extends StatelessWidget {
  const NewsAndEventsDetailsScreen({
    super.key,
    required this.news,
  });
  final NewsEvents news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
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
            NewsAndEventsDetailsWidget(news: news),
            Image.asset(AppAssets.imageSeperator, scale: 3),
            const SizedBox(height: 50)
          ],
        ),
      ),
      bottomSheet: const ContactBottomsheet(),
    );
  }
}
