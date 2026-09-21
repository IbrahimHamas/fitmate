import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.textTheme,
    required this.icon,
    required this.textone,
    required this.texttwo,
  });
  final IconData icon;
  final String textone;
  final String texttwo;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 111.8,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0x1E293B80),
        ),
        child: FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 19.5, color: AppColor.primary),
              Text(textone, style: textTheme.bodySmall!.copyWith(height: 1.3)),
              Text(texttwo, style: textTheme.labelLarge),
            ],
          ),
        ),
      ),
    );
  }
}
