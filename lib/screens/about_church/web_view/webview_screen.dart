import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  final String url;

  static final _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideDrawer(),
      appBar: CustomAppbar(
        drawerKey: _drawerKey,
      ),
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
      bottomSheet: const ContactBottomsheet(),
    );
  }
}
