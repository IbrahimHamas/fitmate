import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/stats_card.dart';
import 'package:flutter/material.dart';

class PlanStatsRow extends StatelessWidget {
  const PlanStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          StatCard(
            textTheme: textTheme,
            icon: Icons.timer_outlined,
            textone: AppStrings.duration,
            texttwo: AppStrings.sixtyToNinetyMinutes,
          ),
          SizedBox(width: 16),
          StatCard(
            textTheme: textTheme,
            icon: Icons.fitness_center,
            textone: AppStrings.frequency,
            texttwo: AppStrings.fiveDaysPerWeek,
          ),
          SizedBox(width: 16),
          StatCard(
            textTheme: textTheme,
            icon: Icons.local_fire_department,
            textone: AppStrings.intensity,
            texttwo: AppStrings.high,
          ),
        ],
      ),
    );
  }
}
