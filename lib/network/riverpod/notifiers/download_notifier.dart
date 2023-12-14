import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/util_functions.dart';

import '../../../config/utils/enums.dart';
import '../../../model/download_model.dart';
import '../../repository/repository.dart';

class DownloadNotifier extends ChangeNotifier {
  ApiStatus _status = ApiStatus.INITIALIZE;
  List<Downloads> _galleryDownloadItems = [];
  List<Downloads> _formDownloadItems = [];
  List<Downloads> _otherDownloadItems = [];
  bool _isDownloading = false;
  String _downloadingUrl = '';
  String _downloadPerc = '';
  String _error = '';

  ApiStatus get status => _status;
  List<Downloads> get galleryDownloadItems => _galleryDownloadItems;
  List<Downloads> get formDownloadItems => _formDownloadItems;
  List<Downloads> get otherDownloadItems => _otherDownloadItems;
  bool get isDownloading => _isDownloading;
  String get downloadingUrl => _downloadingUrl;
  String get downloadPerc => _downloadPerc;
  String get error => _error;
  downloadList() async {
    try {
      notifyState(ApiStatus.LOADING);
      final res = await AppRepository().getDownloadItems();

      /// 1 GELLERY ITEMS 2 FORM ITEMS
      _galleryDownloadItems =
          res?.downloads?.where((element) => element.fileId == '1').toList() ??
              [];
      _formDownloadItems =
          res?.downloads?.where((element) => element.fileId == '2').toList() ??
              [];
      _otherDownloadItems = res?.downloads
              ?.where((element) => !['1', '2'].contains(element.fileId))
              .toList() ??
          [];

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
      await [
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
