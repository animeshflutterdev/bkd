class ApiEndpoints {
  static const bool _isLive = false;

  // Base URLs
  static const String baseUrl =
      _isLive ? "" : 'https://authentication-01s3.onrender.com';
  static const String apiVersion = 'v1';

  // Auth endpoints
  static const String auth = '/auth/api/';
  static const String login = '$auth/login';
  static const String register = '$auth/register';
  static const String logout = '$auth/logout';

  // User endpoints
  static const String userDetails = '$auth/user_details';
  static const String forgotPassword = '$auth/forgot_password';
  static const String updatePassword = '$auth/update_password';
  static const String updateProfile = '$auth/update_profile';

  static const String uploadAvatar = '/profile/avatar';

  // Cart endpoints
  static const String cart = '/cart/';
  static const String addToCart = '$cart/add_to_cart';
  static const String addItem = '$cart/add_item';
  static const String getCart = '$cart/get_cart';
  static const String removeFromCart = '$cart/remove_from_cart';
  static const String clearCart = '$cart/clear_cart';

  // Helper method to get full URL
  static String getFullUrl(String endpoint) {
    return '$baseUrl/$apiVersion$endpoint';
  }
}
