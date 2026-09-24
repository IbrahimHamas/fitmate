import 'package:fitmate/core/common/responsive/responsive.dart';
import 'package:fitmate/core/features/work_out_plans/data/models/work_out_plans_model.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class WorkoutPlanCard extends StatelessWidget {
  final WorkOutPlansModel plan;

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
    final imageWidth = Responsive.width(context, 120);
    final levelColor = _getLevelColor(plan.level);

    return Container(
      margin: EdgeInsets.only(bottom: Responsive.height(context, 16)),
      height: Responsive.height(context, 130),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(Responsive.radius(context, 16)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Responsive.radius(context, 16)),
              bottomLeft: Radius.circular(Responsive.radius(context, 16)),
            ),
            child: Image.network(
              plan.imageUrl,
              width: imageWidth,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: imageWidth,
                color: AppColor.surfaceElevated,
                child: Icon(
                  Icons.fitness_center,
                  color: AppColor.textPrimary,
                  size: Responsive.font(context, 24),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(Responsive.width(context, 12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Responsive.width(context, 8),
                          vertical: Responsive.height(context, 4),
                        ),
                        decoration: BoxDecoration(
                          color: levelColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(
                            Responsive.radius(context, 6),
                          ),
                        ),
                        child: Text(
                          plan.level.toUpperCase(),
                          style: textTheme.labelSmall?.copyWith(
                            color: levelColor,
                          ),
                        ),
                      ),
                      Icon(
                        plan.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppColor.primary,
                        size: Responsive.font(context, 20),
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
                        size: Responsive.font(context, 14),
                        color: AppColor.textSecondary,
                      ),
                      SizedBox(width: Responsive.width(context, 4)),
                      Text(
                        "${plan.duration}",
                        style: textTheme.labelSmall?.copyWith(
                          color: AppColor.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.flash_on,
                        size: Responsive.font(context, 14),
                        color: AppColor.textSecondary,
                      ),
                      SizedBox(width: Responsive.width(context, 4)),
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
