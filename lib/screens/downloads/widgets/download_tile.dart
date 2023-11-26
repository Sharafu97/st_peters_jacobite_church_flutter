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

  // void _downloadResume() async {
  //   if (_isIOS) {
  //     try {
  //       setState(() {
  //         _isDownloading = true;
  //       });
  //       String fileName = _resumeLink.split('/').last;
  //       var file = File('');
  //       Directory? dir;
  //       // if (_isIOS) {
  //       dir = await getApplicationDocumentsDirectory();
  //       // } else {
  //       //   dir = await getApplicationSupportDirectory();
  //       // }
  //       file = File('${dir.path}/$fileName');

  //       if (await file.exists()) {
  //         if (mounted) {
  //           customSnackbar(context,
  //               message: 'File already exists in device',
  //               type: SnackBarType.success);
  //         }
  //         setState(() {
  //           _isDownloading = false;
  //         });
  //       } else {
  //         /// requesting http to get url
  //         var request = await HttpClient().getUrl(Uri.parse(_resumeLink));

  //         /// closing request and getting response
  //         var response = await request.close();

  //         /// getting response data in bytes
  //         var bytes = await consolidateHttpClientResponseBytes(response);

  //         /// writing bytes data of response in the file.
  //         await file.writeAsBytes(bytes);
  //         if (mounted) {
  //           customSnackbar(context,
  //               message: 'Resume saved to device', type: SnackBarType.success);
  //         }
  //         setState(() {
  //           _isDownloading = false;
  //         });
  //       }
  //     } catch (e) {
  //       customSnackbar(context,
  //           message: e.toString(), type: SnackBarType.error);
  //       setState(() {
  //         _isDownloading = false;
  //       });
  //     }
  //   } else {
  //     final Uri url = Uri.parse(_resumeLink);
  //     try {
  //       await launchUrl(url, mode: LaunchMode.externalApplication);
  //     } catch (e) {
  //       customSnackbar(context,
  //           message: 'Could not open link.', type: SnackBarType.error);
  //     }
  //   }
  // }
}
