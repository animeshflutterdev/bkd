import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    if (kIsWeb) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  // Save data
  static Future<bool> saveData(String key, dynamic value) async {
    if (!kIsWeb) return false;

    try {
      if (value is String) {
        return await _prefs?.setString(key, value) ?? false;
      } else if (value is int) {
        return await _prefs?.setInt(key, value) ?? false;
      } else if (value is double) {
        return await _prefs?.setDouble(key, value) ?? false;
      } else if (value is bool) {
        return await _prefs?.setBool(key, value) ?? false;
      } else if (value is List<String>) {
        return await _prefs?.setStringList(key, value) ?? false;
      } else {
        return await _prefs?.setString(key, json.encode(value)) ?? false;
      }
    } catch (e) {
      print('Error saving data: $e');
      return false;
    }
  }

  // Get data
  static dynamic getData(String key) {
    if (!kIsWeb) return null;

    try {
      return _prefs?.get(key);
    } catch (e) {
      print('Error getting data: $e');
      return null;
    }
  }

  // Remove data
  static Future<bool> removeData(String key) async {
    if (!kIsWeb) return false;

    try {
      return await _prefs?.remove(key) ?? false;
    } catch (e) {
      print('Error removing data: $e');
      return false;
    }
  }

  // Clear all data
  static Future<bool> clearAll() async {
    if (!kIsWeb) return false;

    try {
      return await _prefs?.clear() ?? false;
    } catch (e) {
      print('Error clearing data: $e');
      return false;
    }
  }
}
