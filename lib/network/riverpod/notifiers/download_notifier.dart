import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/util_functions.dart';

import '../../../config/utils/enums.dart';
import '../../../model/download_model.dart';
import '../../repository/repository.dart';

class DownloadNotifier extends ChangeNotifier {
  ApiStatus _status = ApiStatus.INITIALIZE;
  List<Downloads> _downloadItems = [];
  String _error = '';

  ApiStatus get status => _status;
  List<Downloads> get downloadItems => _downloadItems;
  String get error => _error;
  downloadList() async {
    try {
      notifyState(ApiStatus.LOADING);
      final res = await AppRepository().getDownloadItems();
      _downloadItems = res?.downloads ?? [];

      notifyState(ApiStatus.SUCCESS);
    } catch (e) {
      _error = e.toString();
      notifyState(ApiStatus.FAILED);
    }
  }

  Future<bool> downLoadFile(String fileUrl) async {
    if (!await Permission.storage.request().isGranted) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        //add more permission to request here.
      ].request();
    }
    try {
      var dir = await getDownloadPath();
      if (dir != null) {
        String savename = fileUrl.split('/').last;
        String savePath = "$dir/$savename";
        print(savePath);

        await Dio().download(fileUrl, savePath,
            onReceiveProgress: (received, total) {
          if (total != -1) {
            print("${(received / total * 100).toStringAsFixed(0)}%");
          }
        });
        print("File is saved to download folder.");
      }
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  notifyState(ApiStatus st) {
    _status = st;
    notifyListeners();
  }
}
