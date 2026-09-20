import 'package:fitmate/core/features/work_out_plans/data/models/work_out_plans_model.dart';
import 'package:fitmate/core/common/responsive/responsive.dart';
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

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 360;
        final imageHeight = isCompact ? 86.0 : 130.0;

        return Container(
          margin: EdgeInsets.only(bottom: Responsive.height(context, 16)),
          height: isCompact
              ? Responsive.height(context, 224)
              : Responsive.height(context, 130),
          decoration: BoxDecoration(
            color: AppColor.surface,
            borderRadius: BorderRadius.circular(Responsive.radius(context, 16)),
          ),
          child: isCompact
              ? Column(
                  children: [
                    _buildImage(context, imageHeight, true),
                    Expanded(child: _buildDetails(context, textTheme)),
                  ],
                )
              : Row(
                  children: [
                    _buildImage(context, imageHeight, false),
                    Expanded(child: _buildDetails(context, textTheme)),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildImage(BuildContext context, double height, bool isCompact) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Responsive.radius(context, 16)),
        bottomLeft: Radius.circular(
          isCompact ? 0 : Responsive.radius(context, 16),
        ),
        topRight: Radius.circular(
          isCompact ? Responsive.radius(context, 16) : 0,
        ),
      ),
      child: Image.network(
        plan.imageUrl,
        width: isCompact ? double.infinity : Responsive.width(context, 120),
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: isCompact ? double.infinity : Responsive.width(context, 120),
          height: height,
          color: AppColor.surfaceElevated,
          child: Icon(
            Icons.fitness_center,
            color: AppColor.textPrimary,
            size: Responsive.font(context, 24),
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context, TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.all(Responsive.width(context, 12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.width(context, 8),
                  vertical: Responsive.height(context, 4),
                ),
                decoration: BoxDecoration(
                  color: _getLevelColor(plan.level).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(
                    Responsive.radius(context, 6),
                  ),
                ),
                child: Text(
                  plan.level.toUpperCase(),
                  style: textTheme.labelSmall?.copyWith(
                    color: _getLevelColor(plan.level),
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                plan.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: AppColor.primary,
                size: Responsive.font(context, 20),
              ),
            ],
          ),
          Text(
            plan.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleSmall?.copyWith(color: AppColor.textPrimary),
          ),
          Text(
            plan.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall?.copyWith(color: AppColor.textBody),
          ),
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: Responsive.font(context, 14),
                color: AppColor.textSecondary,
              ),
              SizedBox(width: Responsive.width(context, 4)),
              Flexible(
                child: Text(
                  plan.duration,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    color: AppColor.textSecondary,
                  ),
                ),
              ),
              SizedBox(width: Responsive.width(context, 16)),
              Icon(
                Icons.flash_on,
                size: Responsive.font(context, 14),
                color: AppColor.textSecondary,
              ),
              SizedBox(width: Responsive.width(context, 4)),
              Flexible(
                child: Text(
                  plan.tagExtra,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    color: AppColor.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
