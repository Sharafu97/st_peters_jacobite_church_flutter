import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/model/areaunits_model.dart';
import 'package:st_peters_jacobite_church_flutter/model/member_search_model.dart';
import 'package:st_peters_jacobite_church_flutter/model/news_event_model.dart';

import '../../model/download_model.dart';
import '../../model/member_details_model.dart';
import '../../model/member_list_model.dart';
import '../api_provider/api_provider.dart';

abstract class Repository {
  Future<MemberListModel>? getMemberList() {
    return null;
  }

  Future<bool>? login(Map<String, dynamic> data) {
    return null;
  }

  Future<bool>? verifyOtp(Map<String, dynamic> data) {
    return null;
  }

  Future<MemberDetailsModel>? getMemberDetails(String memberId) {
    return null;
  }

  Future<AreaUnitsModel>? getAreaUnits() {
    return null;
  }

  Future<SearchMembersModel>? searchMembers(Map<String, dynamic> data) {
    return null;
  }

  Future<DownloadModel>? getDownloadItems() {
    return null;
  }

  Future<NewsEventModel>? getNewsAndEvents() {
    return null;
  }
}

class AppRepository implements Repository {
  final provider = ApiProvider();

  @override
  Future<MemberListModel>? getMemberList() async {
    final res = await provider.getData(AppConstants.MEMBERLISTURL);

    return MemberListModel.fromJson(res);
  }

  @override
  Future<bool>? login(Map<String, dynamic> data) async {
    final res =
        await provider.post(AppConstants.LOGINURL, queryParameters: data);
    return res['status'] == 1;
  }

  @override
  Future<bool>? verifyOtp(Map<String, dynamic> data) async {
    final res = await provider.post(AppConstants.OTPVERIFICATIONURL,
        queryParameters: data);
    return res['status'] == 1;
  }

  @override
  Future<MemberDetailsModel>? getMemberDetails(String memberId) async {
    final res = await provider.getData(
      AppConstants.MEMBERDETAILSURL,
      queryParameters: {'member_code': memberId},
    );

    return MemberDetailsModel.fromJson(res);
  }

  @override
  Future<AreaUnitsModel>? getAreaUnits() async {
    final res = await provider.getData(AppConstants.AREAUNITSURL);

    return AreaUnitsModel.fromJson(res);
  }

  @override
  Future<SearchMembersModel>? searchMembers(Map<String, dynamic> data) async {
    final res = await provider.getData(AppConstants.SEARCHMEMBERURL,
        queryParameters: data);

    return SearchMembersModel.fromJson(res);
  }

  @override
  Future<DownloadModel>? getDownloadItems() async {
    final res = await provider.getData(AppConstants.DOWNLOADLISTURL);

    return DownloadModel.fromJson(res);
  }

  @override
  Future<NewsEventModel>? getNewsAndEvents() async {
    final res = await provider.getData(AppConstants.NEWSEVENTSURL);

    return NewsEventModel.fromJson(res);
  }
}
