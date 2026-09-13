import 'package:flutter/material.dart';

abstract final class AppColor {
  // Shared colors sampled from the supplied fitness screens.
  static const Color primary = Color(0xFF0D7FF2);
  static const Color primaryDark = Color(0xFF0966C3);
  static const Color primaryContainer = Color(0xFF0F2C52);
  static const Color secondary = Color(0xFF334155);
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color background = Color(0xFF101922);
  static const Color surface = Color(0xFF17202E);
  static const Color surfaceSoft = Color(0xFF161F2C);
  static const Color surfaceElevated = Color(0xFF1E293B);
  static const Color surfaceDeep = Color(0xFF0F172A);

  static const Color textPrimary = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textBody = Color(0xFFCBD5E1);
  static const Color hint = Color(0xFF64748B);
  static const Color textDisabled = Color(0xFF475569);

  static const Color inputField = surfaceElevated;
  static const Color inputBorder = Color(0xFF334155);
  static const Color outlineSoft = Color(0xFF1E293B);
  static const Color divider = outlineSoft;
  static const Color controlInactive = secondary;
  static const Color cardShadow = Color(0x33000000);
  static const Color primaryGlow = Color(0x400D7FF2);
  static const Color scrim = Color(0x99000000);

  static const Color danger = Color(0xFFEF4444);
  static const Color dangerContainer = Color(0xFF261D25);
  static const Color success = Color(0xFF10B981);
  static const Color rating = Color(0xFFFACC15);

  static const Color beginner = success;
  static const Color beginnerContainer = Color(0xFF0F373B);
  static const Color intermediate = primary;
  static const Color intermediateContainer = primaryContainer;
  static const Color advanced = Color(0xFFF97316);
  static const Color advancedContainer = Color(0xFF3E2926);
}
