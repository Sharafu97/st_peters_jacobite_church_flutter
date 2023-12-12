import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/model/news_event_model.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/screens/news_and_events/widgets/details_widget.dart';

import '../../theme/assets.dart';
import '../../widgets/appbar.dart';
import '../../widgets/contact_bottombar.dart';
import '../../widgets/title_board.dart';

class NewsAndEventsDetailsScreen extends StatelessWidget {
  const NewsAndEventsDetailsScreen({
    super.key,
    required this.news,
  });
  final NewsEvents news;

  static final _drawerKey = GlobalKey<ScaffoldState>();

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
        child: SingleChildScrollView(
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
      ),
      bottomSheet: const ContactBottomBar(),
    );
  }
}
