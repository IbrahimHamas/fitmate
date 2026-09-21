import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class StartWorkoutButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const StartWorkoutButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 448, minHeight: 56),
        child: SizedBox(
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColor.primary.withValues(alpha: 0.3),
                  offset: Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: -4,
                ),
                BoxShadow(
                  color: AppColor.primary.withValues(alpha: 0.3),
                  offset: Offset(0, 10),
                  blurRadius: 15,
                  spreadRadius: -3,
                ),
              ],
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: onTap,
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    textHeightBehavior: TextHeightBehavior(
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                    style: textTheme.labelLarge,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
