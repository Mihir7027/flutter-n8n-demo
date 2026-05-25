import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage {
  Future<void> writeToken(String token);
  String? readToken();
  bool hasToken();
  Future<void> deleteToken();
  Future<void> write(String key, String value);
  Future<String?> read(String key);
  Future<void> delete(String key);
  Future<void> deleteAll();
}

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage;
  String? _cachedToken;

  SecureStorageImpl() : _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const _tokenKey = 'auth_token';

  @override
  Future<void> writeToken(String token) async {
    _cachedToken = token;
    await _storage.write(key: _tokenKey, value: token);
  }

  @override
  String? readToken() => _cachedToken;

  @override
  bool hasToken() => _cachedToken != null && _cachedToken!.isNotEmpty;

  @override
  Future<void> deleteToken() async {
    _cachedToken = null;
    await _storage.delete(key: _tokenKey);
  }

  Future<void> loadToken() async {
    _cachedToken = await _storage.read(key: _tokenKey);
  }

  @override
  Future<void> write(String key, String value) => _storage.write(key: key, value: value);

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> delete(String key) => _storage.delete(key: key);

  @override
  Future<void> deleteAll() async {
    _cachedToken = null;
    await _storage.deleteAll();
  }
}
