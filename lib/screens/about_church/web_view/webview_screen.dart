import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/loading_widget.dart';
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
  bool _isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final controller = WebViewController.fromPlatformCreationParams(
          const PlatformWebViewControllerCreationParams())
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              debugPrint('progress: $progress');
              if (progress == 100 && mounted) {
                _isLoading = false;
              }
            },
            onPageStarted: (String url) {
              debugPrint('$url started');
            },
            onPageFinished: (String url) {
              debugPrint('$url loaded');
            },
            onWebResourceError: (WebResourceError error) {
              debugPrint('ERROR: ${error.description}');
            },
            onNavigationRequest: (NavigationRequest request) {
              return NavigationDecision.prevent;
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.url));
      _controller = controller;
    });

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
        child: _isLoading
            ? const Center(child: LoadingWidget())
            : WebViewWidget(
                controller: _controller,
              ),
      ),
      bottomSheet: const ContactBottomsheet(),
    );
  }
}
