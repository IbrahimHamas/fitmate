import 'package:flutter/material.dart';

abstract final class Responsive {
  static const double _designWidth = 375;

  static double width(BuildContext context, double value) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return (value * screenWidth / _designWidth).clamp(
      value * 0.86,
      value * 1.2,
    );
  }

  static double height(BuildContext context, double value) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return (value * screenHeight / 812).clamp(value * 0.86, value * 1.2);
  }

  static double font(BuildContext context, double value) {
    final textScale = MediaQuery.textScalerOf(context).scale(1);
    return (value * textScale).clamp(value * 0.9, value * 1.15);
  }

  static double radius(BuildContext context, double value) {
    return width(context, value);
  }

  static bool isCompact(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 360;
  }
}
