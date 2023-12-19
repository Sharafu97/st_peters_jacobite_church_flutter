import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:st_peters_jacobite_church_flutter/widgets/loading_widget.dart';

import '../../config/constants.dart';
import '../../widgets/appbar.dart';

class FileViewScreen extends StatefulWidget {
  const FileViewScreen({super.key, required this.filePath});
  final String filePath;

  @override
  State<FileViewScreen> createState() => _FileViewScreenState();
}

class _FileViewScreenState extends State<FileViewScreen> {
  static final _drawerKey = GlobalKey<ScaffoldState>();
  Uint8List? pdfFileBytes;

  bool _isPdf = false;
  @override
  void initState() {
    super.initState();
    final ext = widget.filePath.split('.').last;
    _isPdf = ext.toLowerCase() == 'pdf';
    loadPdfBytes();
  }

  loadPdfBytes() async {
    if (_isPdf) {
      pdfFileBytes = await http.readBytes(Uri.parse(widget.filePath));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppbar(drawerKey: _drawerKey),
      drawer: const SideDrawer(),
      body: _isPdf
          ? AppConstants().isIOS
              ? PDFView(
                  filePath: widget.filePath,
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageFling: false,
                )
              : pdfFileBytes != null
                  ? PDFView(
                      pdfData: pdfFileBytes,
                      enableSwipe: true,
                      swipeHorizontal: true,
                      autoSpacing: false,
                      pageFling: false,
                    )
                  : const Center(child: LoadingWidget())
          : Center(
              child: AppConstants().isIOS
                  ? Image.file(
                      File(widget.filePath),
                    )
                  : CachedNetworkImage(
                      imageUrl: widget.filePath,
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const Center(child: LoadingWidget()),
                    ),
            ),
    );
  }
}
