// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/model/download_model.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/costom_snackbar.dart';

class DownloadListTile extends ConsumerWidget {
  DownloadListTile({super.key, required this.file});

  final Downloads file;

  final timeStyle = textTheme.bodyLarge?.copyWith();

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: () async {
        final download =
            await ref.read(downloadProvider).downLoadFile(file.phots ?? '');

        if (download) {
          snackBar(context, content: 'Download Completed');
        } else {
          snackBar(context, content: 'Download Failed');
        }
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 50, 10),
        decoration: BoxDecoration(
            color: AppColors.whiteFFFFFF.withOpacity(0.5),
            border: Border.all(color: AppColors.brown41210A.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10)),
        child: Text(file.title ?? 'NILL', style: timeStyle),
      ),
    );
  }
}
