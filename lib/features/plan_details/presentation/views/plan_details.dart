import 'package:fitmate/core/themes/app_color.dart';
import 'package:fitmate/core/themes/app_theme.dart';
import 'package:fitmate/features/plan_details/data/models/exercise_model.dart';
import 'package:fitmate/features/plan_details/data/models/workout_day_model.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/expandable_day_card.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/info_badge.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/plan_details_header.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/plan_hero_image.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/plan_intro_section.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/plan_stats_row.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/rest_day_card.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/section_header.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/start_workout_button.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/stats_card.dart';
import 'package:flutter/material.dart';

class PlanDetails extends StatelessWidget {
  const PlanDetails({super.key});

  final List<WorkoutDayModel> workoutDays = const [
    WorkoutDayModel(
      dayTitle: 'DAY 1',
      mainTitle: 'Push Day: Chest & Triceps',
      isInitiallyExpanded: true,
      exercises: [
        ExerciseModel(
          title: 'Barbell Bench Press',
          subtitle: '4 sets × 10 reps',
        ),
        ExerciseModel(
          title: 'Incline Dumbbell Flys',
          subtitle: '3 sets × 12 reps',
        ),
        ExerciseModel(
          title: 'Tricep Rope Pushdowns',
          subtitle: '4 sets × 15 reps',
        ),
      ],
    ),
    WorkoutDayModel(
      dayTitle: 'DAY 2',
      mainTitle: 'Pull Day: Back & Biceps',
      isInitiallyExpanded: false,
      exercises: [
        ExerciseModel(title: 'Lat Pulldown', subtitle: '4 sets × 10 reps'),
        ExerciseModel(title: 'Barbell Rows', subtitle: '3 sets × 10 reps'),
        ExerciseModel(
          title: 'Bicep Barbell Curls',
          subtitle: '3 sets × 12 reps',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: PlanDetailsHeader(textTheme: textTheme),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlanHeroImage(),
                SizedBox(height: 16),
                PlanIntroSection(),
                SizedBox(height: 16),
                PlanStatsRow(),
                SizedBox(height: 16),
                SectionHeader(
                  title: "Week 1: Foundations",
                  actionText: "View All Weeks",
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: workoutDays.map((dayData) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: ExpandableDayCard(
                          dayData: dayData,
                          textTheme: textTheme,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16),
                RestDayCard(dayLabel: 'Day 3', title: 'Active Recovery'),
                SizedBox(height: 16),
                StartWorkoutButton(title: "START WORKOUT"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
