import 'package:flutter/material.dart';

import '../../../config/utils/enums.dart';
import '../../../model/areaunits_model.dart';
import '../../repository/repository.dart';

class AreaUnitsNotifier extends ChangeNotifier {
  ApiStatus _status = ApiStatus.INITIALIZE;
  List<AreaUnits> _areaUnits = [];
  String _error = '';

  ApiStatus get status => _status;
  List<AreaUnits> get areaUnits => _areaUnits;
  String get error => _error;

  getAreaUnits() async {
    try {
      notifyState(ApiStatus.LOADING);
      final res = await AppRepository().getAreaUnits();
      _areaUnits = res?.areaUnits ?? [];

      notifyState(ApiStatus.SUCCESS);
    } catch (e) {
      _error = e.toString();
      notifyState(ApiStatus.FAILED);
    }
  }

  notifyState(ApiStatus st) {
    _status = st;
    notifyListeners();
  }
}
