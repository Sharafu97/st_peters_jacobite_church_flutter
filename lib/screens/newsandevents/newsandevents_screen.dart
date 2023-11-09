import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

import '../../widgets/contact_bottomsheet.dart';
import 'widgets/newsandevents_listtile.dart';

class NewsAndEventsScreen extends StatelessWidget {
  const NewsAndEventsScreen({super.key});

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
            const TitleBoard(title: 'NEWS&EVENTS'),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(30),
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return Image.asset(AppAssets.imageSeperator, scale: 4);
                },
                itemBuilder: (context, index) {
                  return NewsAndEventsListTile(index: index);
                },
              ),
            )
          ],
        ),
      ),
      bottomSheet: const ContactBottomsheet(showContact: false),
    );
  }
}
