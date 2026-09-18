import 'package:fitmate/core/features/work_out_plans/data/repos/work_out_plans_repository.dart';
import 'package:fitmate/core/features/work_out_plans/presentation/view_model/cubit/work_out_plans_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutPlansCubit extends Cubit<WorkoutPlansState> {
  final WorkoutPlansRepository _repository;

  WorkoutPlansCubit(this._repository) : super(WorkoutPlansInitial());

  Future<void> fetchWorkoutPlans() async {
    emit(WorkoutPlansLoading());
    try {
      final result = await _repository.getWorkoutPlans();
      result.fold(
        (failure) => emit(WorkoutPlansError(failure.message)),
        (plans) => emit(WorkoutPlansSuccess(plans)),
      );
    } catch (e) {
      emit(WorkoutPlansError(e.toString()));
    }
  }
}
