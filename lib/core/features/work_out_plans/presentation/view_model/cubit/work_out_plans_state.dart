 import 'package:fitmate/core/features/work_out_plans/data/models/work_out_plans_model.dart';


abstract class WorkoutPlansState {}

class WorkoutPlansInitial extends WorkoutPlansState {}

class WorkoutPlansLoading extends WorkoutPlansState {}

class WorkoutPlansSuccess extends WorkoutPlansState {
  final List<WorkoutPlanModel> plans;
  WorkoutPlansSuccess(this.plans);
}

class WorkoutPlansError extends WorkoutPlansState {
  final String message;
  WorkoutPlansError(this.message);
}