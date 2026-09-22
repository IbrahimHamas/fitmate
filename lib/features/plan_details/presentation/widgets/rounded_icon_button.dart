import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Color color;
  final Color? iconColor;
  final void Function()? onTap;
  final IconData icon;
  final double size;
  const RoundedIconButton({
    super.key,
    required this.color,
    this.onTap,
    required this.icon,
    required this.size,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Icon(
          icon /*Icons.arrow_back*/,
          size: size /*16*/,
          color: iconColor,
        ),
      ),
    );
  }
}
