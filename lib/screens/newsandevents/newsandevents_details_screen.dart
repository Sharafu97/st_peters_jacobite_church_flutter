import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/screens/newsandevents/widgets/details_widget.dart';

import '../../theme/assets.dart';
import '../../widgets/appbar.dart';
import '../../widgets/contact_bottomsheet.dart';
import '../../widgets/title_board.dart';

class NewsAndEventsDetailsScreen extends StatelessWidget {
  const NewsAndEventsDetailsScreen({super.key});

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
            const NewsAndEventsDetailsWidget(),
            Image.asset(AppAssets.imageSeperator, scale: 3),
            const SizedBox(height: 40)
          ],
        ),
      ),
      bottomSheet: const ContactBottomsheet(showContact: false),
    );
  }
}
