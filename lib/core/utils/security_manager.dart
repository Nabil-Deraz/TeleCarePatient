import 'dart:convert';

import 'package:crypto/crypto.dart';

class SecurityManager {
  static String hashPassword(String password) {
    final bytes = utf8.encode(password); // data being hashed
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static bool comparePasswords(
      String plaintextPassword, String hashedPassword) {
    String hashedInputPassword = hashPassword(plaintextPassword);
    print("hashedInputPassword: $hashedInputPassword");
    print("hashedPassword: $hashedPassword");
    return hashedInputPassword.compareTo(hashedPassword) == 0;
  }
}
