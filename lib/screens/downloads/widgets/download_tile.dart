import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';

class DownloadListTile extends StatelessWidget {
  DownloadListTile({super.key});

  final timeStyle = textTheme.bodyLarge?.copyWith();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 50, 10),
      decoration: BoxDecoration(
          color: AppColors.whiteFFFFFF.withOpacity(0.5),
          border: Border.all(color: AppColors.brown41210A.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10)),
      child:
          Text('St. peters church Logo download from here', style: timeStyle),
    );
  }
}
