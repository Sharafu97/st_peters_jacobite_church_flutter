import 'package:st_peters_jacobite_church_flutter/config/constants.dart';

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
}
