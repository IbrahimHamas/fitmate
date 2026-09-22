import 'package:fitmate/features/work_out_plans/data/models/work_out_plans_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WorkoutPlansRemoteDataSource {
  const WorkoutPlansRemoteDataSource(this._supabaseClient);

  final SupabaseClient _supabaseClient;

  Future<List<WorkoutPlanModel>> getWorkoutPlans() async {
    final response = await _supabaseClient.from('workout_plans').select();

    return (response as List)
        .map((plan) => WorkoutPlanModel.fromJson(plan))
        .toList();
  }
}
