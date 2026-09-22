import 'package:flutter/foundation.dart';

abstract final class AuthRedirects {
  static const mobileCallback = 'com.ironpulse.app://auth-callback';
  static const mobilePasswordReset = 'com.ironpulse.app://reset-password';

  // On web, use the current app path without OAuth query/fragment parameters.
  static String get callback => kIsWeb
      ? Uri.base.replace(query: '', fragment: '').toString()
      : mobileCallback;
  static String get passwordReset => kIsWeb ? callback : mobilePasswordReset;
}
