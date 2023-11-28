import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';

import '../../widgets/appbar.dart';

class FileViewScreen extends StatefulWidget {
  const FileViewScreen({super.key, required this.filePath});
  final String filePath;

  @override
  State<FileViewScreen> createState() => _FileViewScreenState();
}

class _FileViewScreenState extends State<FileViewScreen> {
  static final _drawerKey = GlobalKey<ScaffoldState>();

  bool _isPdf = false;
  @override
  void initState() {
    super.initState();
    final ext = widget.filePath.split('.').last;
    _isPdf = ext.toLowerCase() == 'pdf';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppbar(drawerKey: _drawerKey),
      drawer: const SideDrawer(),
      body: _isPdf
          ? PDFView(
              filePath: widget.filePath,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
            )
          : Center(
              child: Image.file(
                File(widget.filePath),
              ),
            ),
    );
  }
}
