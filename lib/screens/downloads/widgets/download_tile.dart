// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/model/download_model.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/costom_snackbar.dart';

import '../../../config/constants.dart';
import '../../../config/routes.dart';
import '../../../config/utils/util_functions.dart';

class DownloadListTile extends ConsumerStatefulWidget {
  const DownloadListTile({super.key, required this.file, required this.index});
  final Downloads file;
  final int index;

  @override
  ConsumerState<DownloadListTile> createState() => _DownloadListTileState();
}

class _DownloadListTileState extends ConsumerState<DownloadListTile> {
  final timeStyle = textTheme.labelLarge?.copyWith();
  String filePath = '';
  bool ifPathExist = false;

  @override
  void initState() {
    checkRouteExist();
    super.initState();
  }

  checkRouteExist() async {
    var dir = await getDownloadPath();
    if (dir != null) {
      String fileName = widget.file.phots?.split('/').last ?? '';
      filePath = "$dir/$fileName";
      if (await File(filePath).exists()) {
        setState(() => ifPathExist = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final data = ref.watch(downloadProvider);
      return InkWell(
        onTap: () {
          if (ifPathExist) {
            Navigator.pushNamed(context, AppRoutes.fileView,
                arguments: AppConstants().isIOS ? filePath : widget.file.phots);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: widget.index % 2 == 0
                ? AppColors.darkBrownAF8874
                : AppColors.lightBrownD6B9AB,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(widget.file.title ?? 'NIL', style: timeStyle),
              ),
              if (!ifPathExist) ...[
                data.isDownloading && data.downloadingUrl == widget.file.phots
                    ? Text(data.downloadPerc)
                    : InkWell(
                        onTap: () async {
                          final download =
                              await data.downLoadFile(widget.file.phots ?? '');

                          if (download) {
                            checkRouteExist();
                            snackBar(context, content: 'Download Completed');
                          } else {
                            snackBar(context, content: 'Download Failed');
                          }
                        },
                        child: Image.asset(AppAssets.downloadIcon, height: 20),
                      )
              ]
            ],
          ),
        ),
      );
    });
  }
}
