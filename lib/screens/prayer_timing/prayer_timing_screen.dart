import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/contact_bottomsheet.dart';

class PreyerTimingScreen extends StatelessWidget {
  const PreyerTimingScreen({super.key});

  static final _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppbar(drawerKey: _drawerKey),
      drawer: const SideDrawer(),
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imageLogoWatermark),
          ),
        ),
        child: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {},
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  return NavigationDecision.prevent;
                },
              ),
            )
            ..loadRequest(Uri.parse(AppConstants.prayerTimingURL)),
        ),

        // Column(
        //   children: [
        //     const SizedBox(height: 55),
        //     const TitleBoard(title: 'PRAYER TIMINGS'),
        //     Expanded(
        //       child: ListView.separated(
        //         padding: const EdgeInsets.all(30),
        //         itemCount: 10,
        //         separatorBuilder: (context, index) {
        //           return Image.asset(AppAssets.imageSeperator, scale: 4);
        //         },
        //         itemBuilder: (context, index) {
        //           return PrayerTimingListTile();
        //         },
        //       ),
        //     )
        //   ],
        // ),
      ),
      bottomSheet: const ContactBottomsheet(),
    );
  }
}
