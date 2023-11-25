import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/model/member_details_model.dart';

import '../../../model/member_list_model.dart';
import '../../repository/repository.dart';

class MemberNotifier extends ChangeNotifier {
  ApiStatus _status = ApiStatus.INITIALIZE;
  ApiStatus _detailsStatus = ApiStatus.INITIALIZE;
  List<Members> _members = [];
  Member? _member;
  List<FamilyDetails> _familyDetails = [];
  FamilyDetails? _husband;
  FamilyDetails? _wife;
  String _error = '';

  ApiStatus get status => _status;
  ApiStatus get detailsStatus => _detailsStatus;
  List<Members> get members => _members;
  Member? get member => _member;
  List<FamilyDetails> get familyDetails => _familyDetails;
  FamilyDetails? get husband => _husband;
  FamilyDetails? get wife => _wife;
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

  getMemberDetails(String memberId) async {
    try {
      notifyDetailsState(ApiStatus.LOADING);
      final res = await AppRepository().getMemberDetails(memberId);
      _member = res?.member?[0];
      _familyDetails = res?.familyDetails ?? [];
      _husband = _familyDetails
          .firstWhere((element) => element.relationship == 'Husband');
      _wife = _familyDetails
          .firstWhere((element) => element.relationship == 'Wife');

      notifyDetailsState(ApiStatus.SUCCESS);
    } catch (e) {
      _error = e.toString();
      notifyDetailsState(ApiStatus.FAILED);
    }
  }

  notifyState(ApiStatus st) {
    _status = st;
    notifyListeners();
  }

  notifyDetailsState(ApiStatus st) {
    _detailsStatus = st;
    notifyListeners();
  }
}
