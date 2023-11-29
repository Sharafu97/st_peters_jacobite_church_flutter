import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/secure_storage.dart';
import 'package:st_peters_jacobite_church_flutter/network/repository/repository.dart';

class LoginNotifier extends ChangeNotifier {
  ApiStatus _loginStatus = ApiStatus.INITIALIZE;
  ApiStatus _verifyStatus = ApiStatus.INITIALIZE;
  String _error = '';

  ApiStatus get loginStatus => _loginStatus;
  ApiStatus get verifyStatus => _verifyStatus;
  String get error => _error;

  bool _resend = false;
  bool get resend => _resend;

  Future<void> login(String memberCode, {bool resend = false}) async {
    if (_loginStatus == ApiStatus.LOADING) return;
    try {
      _resend = resend;
      notifyLoginState(ApiStatus.LOADING);
      final data = <String, dynamic>{
        'member_code': memberCode,
      };
      await AppRepository().login(data);
      notifyLoginState(ApiStatus.SUCCESS);
    } catch (e) {
      _error = e.toString();
      notifyLoginState(ApiStatus.FAILED);
    }
  }

  Future<void> verifyOtp(String memberCode, String otp) async {
    if (_verifyStatus == ApiStatus.LOADING) return;
    try {
      notifyVerifyState(ApiStatus.LOADING);
      final data = <String, dynamic>{
        'member_code': memberCode,
        'OTP': otp,
      };
      await AppRepository().verifyOtp(data);
      await StorageUtils().authenticateUser();
      notifyVerifyState(ApiStatus.SUCCESS);
    } catch (e) {
      _error = e.toString();
      notifyVerifyState(ApiStatus.FAILED);
    }
  }

  void notifyLoginState(ApiStatus status) {
    _loginStatus = status;
    notifyListeners();
  }

  void notifyVerifyState(ApiStatus status) {
    _verifyStatus = status;
    notifyListeners();
  }
}
