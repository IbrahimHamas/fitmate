import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/features/plan_details/data/models/exercise_model.dart';
import 'package:fitmate/features/plan_details/data/models/workout_day_model.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/expandable_day_card.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/plan_details_header.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/plan_hero_image.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/plan_intro_section.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/plan_stats_row.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/rest_day_card.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/section_header.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/start_workout_button.dart';
import 'package:flutter/material.dart';

class PlanDetails extends StatelessWidget {
  const PlanDetails({super.key});

  final List<WorkoutDayModel> workoutDays = const [
    WorkoutDayModel(
      dayTitle: AppStrings.dayOneUppercase,
      mainTitle: AppStrings.pushDayChestAndTriceps,
      isInitiallyExpanded: true,
      exercises: [
        ExerciseModel(
          title: AppStrings.barbellBenchPress,
          subtitle: AppStrings.fourSetsTenReps,
        ),
        ExerciseModel(
          title: AppStrings.inclineDumbbellFlys,
          subtitle: AppStrings.threeSetsTwelveReps,
        ),
        ExerciseModel(
          title: AppStrings.tricepRopePushdowns,
          subtitle: AppStrings.fourSetsFifteenReps,
        ),
      ],
    ),
    WorkoutDayModel(
      dayTitle: AppStrings.dayTwoUppercase,
      mainTitle: AppStrings.pullDayBackAndBiceps,
      isInitiallyExpanded: false,
      exercises: [
        ExerciseModel(
          title: AppStrings.latPulldown,
          subtitle: AppStrings.fourSetsTenReps,
        ),
        ExerciseModel(
          title: AppStrings.barbellRows,
          subtitle: AppStrings.threeSetsTenReps,
        ),
        ExerciseModel(
          title: AppStrings.bicepBarbellCurls,
          subtitle: AppStrings.threeSetsTwelveReps,
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
                  title: AppStrings.weekOneFoundations,
                  actionText: AppStrings.viewAllWeeks,
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
                RestDayCard(
                  dayLabel: AppStrings.dayThree,
                  title: AppStrings.activeRecovery,
                ),
                SizedBox(height: 16),
                StartWorkoutButton(title: AppStrings.startWorkoutUppercase),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
