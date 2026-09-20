import 'package:fitmate/core/features/work_out_plans/data/models/work_out_plans_model.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class WorkoutPlanCard extends StatelessWidget {
  final WorkoutPlanModel plan;

  const WorkoutPlanCard({super.key, required this.plan});

  Color _getLevelColor(String level) {
    switch (level.toLowerCase()) {
      case 'intermediate':
        return AppColor.intermediate;
      case 'advanced':
        return AppColor.advanced;
      case 'beginner':
        return AppColor.beginner;
      default:
        return AppColor.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 130,
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.network(
              plan.imageUrl,
              width: 120,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 120,
                color: AppColor.surfaceElevated,
                child: Icon(
                  Icons.fitness_center,
                  color: AppColor.textPrimary,
                  size: 24,
                ),
              ),
            ),
          ),
          // Details Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getLevelColor(
                            plan.level,
                          ).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          plan.level.toUpperCase(),
                          style: textTheme.labelSmall?.copyWith(
                            color: _getLevelColor(plan.level),
                          ),
                        ),
                      ),
                      Icon(
                        plan.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppColor.primary,
                        size: 20,
                      ),
                    ],
                  ),
                  Text(
                    plan.title,
                    style: textTheme.titleSmall?.copyWith(
                      color: AppColor.textPrimary,
                    ),
                  ),
                  Text(
                    plan.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColor.textBody,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: AppColor.textSecondary,
                      ),
                      SizedBox(width: 4),
                      Text(
                        plan.duration,
                        style: textTheme.labelSmall?.copyWith(
                          color: AppColor.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.flash_on,
                        size: 14,
                        color: AppColor.textSecondary,
                      ),
                      SizedBox(width: 4),
                      Text(
                        plan.tagExtra,
                        style: textTheme.labelSmall?.copyWith(
                          color: AppColor.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
