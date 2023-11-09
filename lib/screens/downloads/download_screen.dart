import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

import '../../widgets/contact_bottomsheet.dart';
import 'widgets/download_tile.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.logoWatermark),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 55),
            const TitleBoard(title: 'DOWNLOADS'),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(30),
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return Image.asset(AppAssets.seperator, scale: 4);
                },
                itemBuilder: (context, index) {
                  return DownloadListTile();
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
