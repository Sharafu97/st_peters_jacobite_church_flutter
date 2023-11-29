import 'package:flutter/material.dart';

import '../../../config/utils/enums.dart';
import '../../../model/spiritual_org_model.dart';
import '../../repository/repository.dart';

class SpiritualOrgNotifier extends ChangeNotifier {
  ApiStatus _status = ApiStatus.INITIALIZE;
  List<SpiritualOrganizations> _spiritualOrganizations = [];
  String _error = '';

  ApiStatus get status => _status;
  List<SpiritualOrganizations> get spiritualOrganizations =>
      _spiritualOrganizations;
  String get error => _error;

  getSpiritualOrganizations() async {
    try {
      notifyState(ApiStatus.LOADING);
      final res = await AppRepository().getSpiritualOrg();
      _spiritualOrganizations = res?.spiritualOrganizations ?? [];

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
