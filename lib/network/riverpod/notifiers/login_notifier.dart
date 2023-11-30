import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/network/repository/repository.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/notifiers/auth_notifier.dart';

class LoginNotifier extends ChangeNotifier {
  LoginNotifier(this._auth);
  final AuthNotifier _auth;
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
      final user = await AppRepository().verifyOtp(data)!;
      _auth.authenticate(user);
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
