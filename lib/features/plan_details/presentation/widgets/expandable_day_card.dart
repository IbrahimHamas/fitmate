import 'package:fitmate/core/themes/app_color.dart';
import 'package:fitmate/features/plan_details/data/models/workout_day_model.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/exercise_item.dart';
import 'package:flutter/material.dart';

class ExpandableDayCard extends StatefulWidget {
  final WorkoutDayModel dayData;
  final TextTheme textTheme;

  const ExpandableDayCard({
    super.key,
    required this.dayData,
    required this.textTheme,
  });

  @override
  State<ExpandableDayCard> createState() => _ExpandableDayCardState();
}

class _ExpandableDayCardState extends State<ExpandableDayCard> {
  late bool _isExpanded;

  static const Color _borderColor = Color(0xFF1E2938);
  static const Color _cardBackgroundColor = Color(0xFF0F172A);
  static const Color _primaryAccentColor = Color(0xFF38BDF8);
  static const Color _secondaryTextColor = Color(0xFF94A3B8);

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.dayData.isInitiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.surfaceElevated.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.surfaceElevated, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // رأس الكارت (Header)
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.dayData.dayTitle.toUpperCase(),
                          style: widget.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.dayData.mainTitle,
                            style: widget.textTheme.titleMedium!.copyWith(
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColor.textSecondary,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),

          if (_isExpanded) ...[
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Column(
                children: [
                  const Divider(color: _borderColor, height: 1),
                  const SizedBox(height: 12),
                  ...widget.dayData.exercises.map((exercise) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ExerciseItemWidget(
                        title: exercise.title,
                        subtitle: exercise.subtitle,
                        textTheme: widget.textTheme,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
