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
  bool _isDownloading = false;
  String _downloadingUrl = '';
  String _downloadPerc = '';
  String _error = '';

  ApiStatus get status => _status;
  List<Downloads> get downloadItems => _downloadItems;
  bool get isDownloading => _isDownloading;
  String get downloadingUrl => _downloadingUrl;
  String get downloadPerc => _downloadPerc;
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

  Future<bool> downLoadFile(
    String fileUrl,
  ) async {
    if (!await Permission.storage.request().isGranted) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        //add more permission to request here.
      ].request();
    }

    notifyDownloadState(fileUrl, true);

    try {
      var dir = await getDownloadPath();
      if (dir != null) {
        String savename = fileUrl.split('/').last;
        String savePath = "$dir/$savename";
        debugPrint(savePath);

        await Dio().download(fileUrl, savePath,
            onReceiveProgress: (received, total) {
          if (total != -1) {
            _downloadPerc = "${(received / total * 100).toStringAsFixed(0)}%";
            notifyListeners();
          }
        });
        debugPrint("File is saved to download folder.");
      }
      notifyDownloadState('', false);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      notifyDownloadState('', false);
      return false;
    }
  }

  notifyState(ApiStatus st) {
    _status = st;
    notifyListeners();
  }

  notifyDownloadState(String url, bool downloading) {
    _downloadingUrl = url;
    _isDownloading = downloading;
    notifyListeners();
  }
}
