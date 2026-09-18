import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationItemModel {
  const NavigationItemModel({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.page,
  });

  final String label;
  final SvgAssetLoader icon;
  final SvgAssetLoader selectedIcon;
  final Widget page;
}
