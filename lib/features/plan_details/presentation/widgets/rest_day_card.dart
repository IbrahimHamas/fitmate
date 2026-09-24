import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class RestDayCard extends StatelessWidget {
  final String dayLabel;
  final String title;
  const RestDayCard({super.key, required this.dayLabel, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Opacity(
      opacity: 0.6,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.surfaceElevated.withValues(alpha: 0.4),
          border: Border.all(
            width: 1,
            color: AppColor.surfaceElevated,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.dayThree.toUpperCase(),
                    textHeightBehavior: TextHeightBehavior(
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                    style: textTheme.headlineSmall!.copyWith(
                      color: AppColor.hint,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 0.5),
                  Text(
                    AppStrings.activeRecovery,
                    textHeightBehavior: TextHeightBehavior(
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                    style: textTheme.titleMedium!.copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
            Icon(Icons.bed_outlined, size: 27.5, color: AppColor.textSecondary),
          ],
        ),
      ),
    );
  }
}
