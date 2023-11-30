import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  static final _drawerKey = GlobalKey<ScaffoldState>();
  late final WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController.fromPlatformCreationParams(
        const PlatformWebViewControllerCreationParams())
      ..loadRequest(Uri.parse(widget.url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideDrawer(),
      appBar: CustomAppbar(
        drawerKey: _drawerKey,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height -
            const CustomAppbar().preferredSize.height,
        width: MediaQuery.of(context).size.width,
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
      bottomSheet: const ContactBottomsheet(),
    );
  }
}
