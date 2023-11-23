import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';

import '../../../model/member_list_model.dart';
import '../../repository/repository.dart';

class MemberNotifier extends ChangeNotifier {
  ApiStatus _status = ApiStatus.INITIALIZE;
  String _error = '';
  List<Members> _members = [];

  ApiStatus get status => _status;
  List<Members> get members => _members;
  String get error => _error;

  getMembers() async {
    try {
      notifyState(ApiStatus.LOADING);
      final res = await AppRepository().getMemberList();
      _members = res?.members ?? [];

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
