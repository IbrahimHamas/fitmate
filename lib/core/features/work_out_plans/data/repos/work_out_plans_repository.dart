import 'package:dartz/dartz.dart';
import 'package:fitmate/core/features/work_out_plans/data/models/work_out_plans_model.dart';
import 'package:fitmate/core/services/errors/failure.dart';
import 'package:fitmate/core/services/request_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WorkoutPlansRepository {
  final SupabaseClient _supabaseClient;

  WorkoutPlansRepository(this._supabaseClient);

  Future<Either<Failure, List<WorkoutPlanModel>>> getWorkoutPlans() async {
    return requestHandler(() async {
      final response = await _supabaseClient.from('workout_plans').select();

      return (response as List)
          .map((e) => WorkoutPlanModel.fromJson(e))
          .toList();
    });
  }
}
