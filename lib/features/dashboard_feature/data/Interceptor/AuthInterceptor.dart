import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticatedHttpClient extends http.BaseClient {
  SharedPreferences sharedPref;

  AuthenticatedHttpClient({required this.sharedPref});

  // Use a memory cache to avoid local storage access in each call
  String _inMemoryToken = '';

  String get userAccessToken {
    // use in memory token if available
    if (_inMemoryToken.isNotEmpty) return _inMemoryToken;

    // otherwise load it from local storage
    _inMemoryToken = _loadTokenFromSharedPreference();

    return _inMemoryToken;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // intercept each call and add the Authorization header if token is available
    if (userAccessToken.isNotEmpty) {
      if (request.headers.containsKey("Authorization")) {
        request.headers
            .update('Authorization', (_) => 'Bearer $userAccessToken');
      }

      if (request.headers.containsKey("authorizationuser")) {
        request.headers
            .update('authorizationuser', (_) => 'Bearer $userAccessToken');
      }
    }

    print(request.headers);

    return request.send();
  }

  String _loadTokenFromSharedPreference() {
    final token = sharedPref.getString("token");
    print("i'm here $token");
    return token!;
  }

  // Don't forget to reset the cache when logging out the user
  void reset() {
    _inMemoryToken = '';
  }
}
