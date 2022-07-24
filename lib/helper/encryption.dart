import 'dart:convert';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/export.dart';

class Encryption {
  final String _publicKey =
      // ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
      'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtYGgS10tTAMiSwb1nOcY' +
          'q33Vua0LhAL2AomcyCTiu6VirlfTUbgOJlsZUKPdwuWwEticqbMB3XYuguPIY92R' +
          'p6UUTwa4A4N5VXi3u3l7odktG5t2NkgUGixL1mTgQhSntjF3GeBLfg6j2VZ+OSK6' +
          'cBN7F5/Kj/rrsR9TQZrdASHkXlo6rw3LCCn8i0VeApGy3iptFYQSmWNgrMk0QBaA' +
          'b6ydep+iXilLgM5at/ntNrcXdvz69XEsj6Ah0Cs7cNwK9usnEg/L4CQl6wxnNgwO' +
          'F3l+XWvb3U+SXkBKrRAjEz8gp0YoSThyLn75uFwcGpD5fzoNXMUGjnUvwul+pGm3' +
          'jQIDAQAB';

  String encrypt(String plaintext, String publicKey) {
    var pem =
        '-----BEGIN RSA PUBLIC KEY-----\n$publicKey\n-----END RSA PUBLIC KEY-----';
    var public = CryptoUtils.rsaPublicKeyFromPem(pem);

    var cipher = PKCS1Encoding(RSAEngine());
    cipher.init(true, PublicKeyParameter<RSAPublicKey>(public));

    Uint8List output =
        cipher.process(Uint8List.fromList(utf8.encode(plaintext)));
    var base64EncodedText = base64Encode(output);
    return base64EncodedText;
  }

  String text(String text) {
    return encrypt(text, _publicKey);
  }
}
