import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageUtils {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  static const _authKey = 'authenticate';

  Future<void> authenticateUser() async {
    await _secureStorage.write(key: _authKey, value: 'true');
  }

  Future<bool> checkUserAuthentication() async {
    final res = await _secureStorage.read(key: _authKey) == 'true';
    return res;
  }

  Future<void> unauthenticateUser() async {
    await _secureStorage.delete(key: _authKey);
  }
}
