import 'package:fit_up/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class ProfileStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String label;

  const ProfileStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.outlineSoft),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColor.textSecondary),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColor.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColor.hint,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
