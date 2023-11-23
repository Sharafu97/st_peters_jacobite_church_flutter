import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/loading_widget.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    // final textStyle = Theme.of(context).textTheme;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppbar(),
      body: WebViewWidget(
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
          ..loadRequest(Uri.parse(url)),
      ),

      // LayoutBuilder(builder: (context, constraints) {
      //   return SizedBox(
      //     height: constraints.maxHeight,
      //     width: constraints.maxWidth,
      //     child: Stack(
      //       children: [
      //         Positioned(
      //           top: -50,
      //           width: constraints.maxWidth,
      //           child: Image.asset(
      //             AppAssets.imageLogoWatermark,
      //           ),
      //         ),
      //         SizedBox(
      //           height: constraints.maxHeight,
      //           width: constraints.maxWidth,
      //           child: Column(
      //             children: [
      //               SizedBox(
      //                 height: screenHeight * 0.13,
      //               ),
      //               Stack(
      //                 clipBehavior: Clip.none,
      //                 children: [
      //                   SizedBox(
      //                     width: constraints.maxWidth,
      //                     child: Center(
      //                       child: Image.asset(
      //                         AppAssets.imageChurch,
      //                         width: constraints.maxWidth * 0.7,
      //                       ),
      //                     ),
      //                   ),
      //                   const Positioned(
      //                     bottom: -20,
      //                     child: TitleBoard(
      //                       title: 'ABOUT THE CHURCH',
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               SizedBox(height: screenHeight * 0.03),
      //               Flexible(
      //                 child: Padding(
      //                   padding: const EdgeInsets.symmetric(
      //                       horizontal: AppConstants.largePadding),
      //                   child: SingleChildScrollView(
      //                     child: Column(
      //                       children: [
      //                         Text(
      //                           AppConstants.loremIpsum,
      //                           style: textStyle.bodyLarge,
      //                         ),
      //                         const SizedBox(
      //                             height: AppConstants.defaultPadding),
      //                         Image.asset(
      //                           AppAssets.imageEndLine,
      //                           scale: 2,
      //                         ),
      //                         const SizedBox(height: 90),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   );
      // }),
      bottomSheet: const ContactBottomsheet(),
    );
  }
}
