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
            textone: "Duration",
            texttwo: "60-90m",
          ),
          SizedBox(width: 16),
          StatCard(
            textTheme: textTheme,
            icon: Icons.fitness_center,
            textone: 'Frequency',
            texttwo: '5 Days/Wk',
          ),
          SizedBox(width: 16),
          StatCard(
            textTheme: textTheme,
            icon: Icons.local_fire_department,
            textone: 'Intensity',
            texttwo: 'High',
          ),
        ],
      ),
    );
  }
}
