import 'package:flutter/material.dart';

class InfoBadge extends StatelessWidget {
  final String text;
  final Color color;
  const InfoBadge({
    super.key,
    required this.textTheme,
    required this.text,
    required this.color,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color,
      ),
      child: Text(
        text.toUpperCase(),
        style: textTheme.labelSmall!.copyWith(height: 1.5),
      ),
    );
  }
}
