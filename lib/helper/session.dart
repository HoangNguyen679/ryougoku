import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(),
);

class SessionHelper {
  static Future<bool> generateQrSession(
      String? qrToken, String? userToken) async {
    if (qrToken == null || userToken == null) {
      throw Exception('Failed to get qrToken');
    }

    var url =
        Uri.parse('https://api.kagayakuw-dev.com/v1/mobile/generate_qr_code');

    logger.i('userToken: $userToken');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': userToken,
      },
      body: jsonEncode(<String, String>{
        'token': qrToken,
      }),
    );

    logger.i(response);

    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
      // throw Exception('Failed to get access token');
    }
  }
}
