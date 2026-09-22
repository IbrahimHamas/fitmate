import 'package:fitmate/features/plan_details/data/models/exercise_model.dart';

class WorkoutDayModel {
  final String dayTitle;
  final String mainTitle;
  final List<ExerciseModel> exercises;
  final bool isInitiallyExpanded;

  const WorkoutDayModel({
    required this.dayTitle,
    required this.mainTitle,
    required this.exercises,
    this.isInitiallyExpanded = false,
  });
}
