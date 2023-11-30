import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:st_peters_jacobite_church_flutter/model/user_model.dart';

class AuthNotifier extends ChangeNotifier with CacheManager {
  AuthState _state = AuthState.initialize;
  AuthState get state => _state;
  late UserModel _userData;
  UserModel get userData => _userData;
  String _error = '';
  String get error => _error;

  Future<void> init() async {
    UserModel? user;
    try {
      user = await getUser();
    } catch (e) {
      _error = e.toString();
    }
    if (user != null) {
      UserData().user = user;
      _userData = user;
      changeState(AuthState.authenticated);
    } else {
      changeState(AuthState.unauthenticated);
    }
  }

  Future<void> authenticate(UserModel logData) async {
    UserData().user = logData;
    await saveUser(logData);
    changeState(AuthState.authenticated);
  }

  Future<void> unauthenticate() async {
    UserData().user = UserModel();
    await deleteUser();
    changeState(AuthState.unauthenticated);
  }

  void changeState(value) {
    _state = value;
    notifyListeners();
  }
}

enum AuthState { initialize, authenticated, unauthenticated }

mixin CacheManager {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<bool> saveUser(UserModel userModel) async {
    //Stores usermodel in secure storage after json encoding
    try {
      final userString = json.encode(userModel.toJson());
      await secureStorage.write(key: 'user', value: userString);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteUser() async {
    await secureStorage.deleteAll();
  }

  Future<UserModel?> getUser() async {
    //Retrieves user model json and decoding back to user model class
    final userString = await secureStorage.read(key: 'user') ?? '';
    return userString != ''
        ? UserModel.fromJson(json.decode(userString) as Map<String, dynamic>)
        : null;
  }
}
