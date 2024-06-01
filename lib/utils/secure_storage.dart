import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();

  static const storage = FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  static void writeToStorage({
    required String key,
    required String value,
  }) async {
    try {
      await storage.write(key: key, value: value);
    } catch (e) {
      debugPrint('$e');
    }
  }

  static Future<String> readFromStorage({
    required String key,
  }) async {
    String value = '';
    try {
      value = await storage.read(
            key: key,
          ) ??
          '';
    } catch (e) {
      debugPrint('$e');
    }
    return value;
  }

  static Future<void> deleteFromStorage({
    required String key,
  }) async {
    try {
      await storage.delete(
        key: key,
      );
    } catch (e) {
      debugPrint('$e');
    }
  }

//   String value = await storage.read(key: key);

// // Read all values
// Map<String, String> allValues = await storage.readAll();

// // Delete value
// await storage.delete(key: key);

// // Delete all
// await storage.deleteAll();

// // Write value
  static set setToken(String value) {
    writeToStorage(key: 'token', value: value);
  }

  static Future<String> get getToken async {
    return await readFromStorage(key: 'token');
  }

  static set setPin(String value) {
    writeToStorage(key: 'pin', value: value);
  }

  static Future<String> get getPin async {
    return await readFromStorage(key: 'pin');
  }

  static set setIsFirstTimer(String value) {
    writeToStorage(key: 'isFirstTimer', value: value);
  }

  static Future<bool> get getIsFirstTimer async {
    final val = await readFromStorage(key: 'isFirstTimer');
    return val == 'false' ? true : false;
  }

  static Future<void> get deleteToken async {
    deleteFromStorage(
      key: 'token',
    );
  }
}
