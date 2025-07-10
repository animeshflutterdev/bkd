import 'dart:convert';

import 'api_endpoints.dart';
import 'api_service.dart';

class UserApiService {
  // Get user profile
  static Future<Map<String, dynamic>> getUserProfile(String userId) async {
    try {
      final response = await ApiService.get('${ApiEndpoints.logout}/$userId');
      return json.decode(ApiService.handleResponse(response));
    } catch (e) {
      throw Exception('Failed to get user profile: $e');
    }
  }

  // Update user profile
  static Future<Map<String, dynamic>> updateUserProfile(
    String userId,
    Map<String, dynamic> userData,
  ) async {
    try {
      final response = await ApiService.put(
        '${ApiEndpoints.updateProfile}/$userId',
        body: userData,
      );
      return json.decode(ApiService.handleResponse(response));
    } catch (e) {
      throw Exception('Failed to update user profile: $e');
    }
  }

  // Delete user account
  static Future<void> deleteUserAccount(String userId) async {
    try {
      final response =
          await ApiService.delete('${ApiEndpoints.logout}/$userId');
      ApiService.handleResponse(response);
    } catch (e) {
      throw Exception('Failed to delete user account: $e');
    }
  }

  // Get user settings
  static Future<Map<String, dynamic>> getUserSettings(String userId) async {
    try {
      final response = await ApiService.get('${ApiEndpoints.getCart}/$userId');
      return json.decode(ApiService.handleResponse(response));
    } catch (e) {
      throw Exception('Failed to get user settings: $e');
    }
  }
}
