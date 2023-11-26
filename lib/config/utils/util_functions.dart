import 'dart:io';

import 'package:path_provider/path_provider.dart';

String getBloodGroup(String bloodGroupId) {
  switch (bloodGroupId) {
    case '1':
      return 'A +ve';
    case '2':
      return 'A -ve';
    case '3':
      return 'B +ve';
    case '4':
      return 'B -ve';
    case '5':
      return 'O +ve';
    case '6':
      return 'O -ve';
    case '7':
      return 'AB +ve';
    case '8':
      return 'AB -ve';
    default:
      return '';
  }
}

Future<String?> getDownloadPath() async {
  Directory? directory;
  try {
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');

      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }
  } catch (err, stack) {
    print("Cannot get download folder path");
  }
  return directory?.path;
}
