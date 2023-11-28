import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/model/committee_model.dart';
import 'package:st_peters_jacobite_church_flutter/network/repository/repository.dart';

class CommitteeNotifier extends ChangeNotifier {
  ApiStatus _status = ApiStatus.INITIALIZE;
  ApiStatus get status => _status;

  late CommitteeMember _president;
  CommitteeMember get predident => _president;

  List<CommitteeMember> _coreCommittee = [];
  List<CommitteeMember> get coreCommittee => _coreCommittee;

  List<CommitteeMember> _committeeMembers = [];
  List<CommitteeMember> get committeeMembers => _committeeMembers;

  List<CommitteeMember> _auditors = [];
  List<CommitteeMember> get auditors => _auditors;

  String _error = '';
  String get error => _error;

  Future<void> getCommittee() async {
    try {
      notifyState(ApiStatus.LOADING);
      final res = await AppRepository().getCommittee();
      _president = res!.president![0];
      _coreCommittee = res.committees ?? [];
      _committeeMembers = res.committeeMember ?? [];
      _auditors = res.auditors ?? [];

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
