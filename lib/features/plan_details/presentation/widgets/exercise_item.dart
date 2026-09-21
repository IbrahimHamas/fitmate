import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class ExerciseItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextTheme textTheme;

  const ExerciseItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColor.inputBorder,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(
            Icons.open_in_full,
            color: AppColor.hint,
            size: 19.8,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: textTheme.bodySmall!.copyWith(
                  height: 1.3,
                  color: AppColor.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
