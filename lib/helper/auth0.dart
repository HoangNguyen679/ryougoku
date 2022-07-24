import 'dart:convert';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../model/constant.dart';

class Auth0Helper {
  final secureStorage = const FlutterSecureStorage();

  Future<Map<String, Object>> initAction(String storedRefreshToken) async {
    final response = await _tokenRequest(storedRefreshToken);

    final idToken = _parseIdToken(response?.idToken);
    final profile = await _getUserDetails(response?.accessToken);

    secureStorage.write(
      key: REFRESH_TOKEN_KEY,
      value: response!.refreshToken,
    );

    return {...idToken, ...profile};
  }

  Future<TokenResponse?> _tokenRequest(String? storedRefreshToken) async {
    if (!checkAuth0Parameter()) {
      throw Exception('Auth0 Parameter not set');
    }

    return await const FlutterAppAuth().token(TokenRequest(
      dotenv.env['AUTH0_CLIENT_ID'] as String,
      dotenv.env['AUTH0_REDIRECT_URI'] as String,
      issuer: dotenv.env['AUTH0_ISSUER'] as String,
      refreshToken: storedRefreshToken,
    ));
  }

  Future<Map<String, Object>> login() async {
    final AuthorizationTokenResponse? result = await _authorizeExchange();

    final Map<String, Object> idToken = _parseIdToken(result?.idToken);
    final Map<String, Object> profile =
        await _getUserDetails(result?.accessToken);

    await secureStorage.write(
      key: REFRESH_TOKEN_KEY,
      value: result!.refreshToken,
    );
    return {...idToken, ...profile};
  }

  Future<AuthorizationTokenResponse?> _authorizeExchange() async {
    if (!checkAuth0Parameter()) {
      throw Exception('Auth0 Parameter not set');
    }

    return await const FlutterAppAuth().authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        dotenv.env['AUTH0_CLIENT_ID'] as String,
        dotenv.env['AUTH0_REDIRECT_URI'] as String,
        issuer: dotenv.env['AUTH0_ISSUER'] as String,
        scopes: <String>['openid', 'profile', 'offline_access', 'email'],
        promptValues: ['login'],
      ),
    );
  }

  Map<String, Object> _parseIdToken(String? idToken) {
    final List<String> parts = idToken!.split('.');
    assert(parts.length == 3);

    return Map<String, Object>.from(jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1])))));
  }

  Future<Map<String, Object>> _getUserDetails(String? accessToken) async {
    if (!checkAuth0Parameter()) {
      throw Exception('Auth0 Parameter not set');
    }

    final http.Response response = await http.get(
      Uri.parse('${dotenv.env['AUTH0_ISSUER'] as String}/userinfo'),
      headers: <String, String>{'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return Map<String, Object>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get user details');
    }
  }

  bool checkAuth0Parameter() {
    final domain = dotenv.env['AUTH0_DOMAIN'];
    final clientId = dotenv.env['AUTH0_CLIENT_ID'];
    final redirectUri = dotenv.env['AUTH0_REDIRECT_URI'];
    final issuer = dotenv.env['AUTH0_ISSUER'];

    return domain != null &&
        clientId != null &&
        redirectUri != null &&
        issuer != null;
  }
}
