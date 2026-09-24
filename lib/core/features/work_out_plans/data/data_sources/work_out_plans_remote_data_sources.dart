import 'package:fitmate/core/features/work_out_plans/data/models/work_out_plans_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WorkoutPlansRemoteDataSource {
  const WorkoutPlansRemoteDataSource(this._supabaseClient);

  final SupabaseClient _supabaseClient;

  Future<List<WorkOutPlansModel>> getWorkoutPlans() async {
    final response = await _supabaseClient.from('workout_plans').select();

    return (response as List)
        .map((plan) => WorkOutPlansModel.fromJson(plan))
        .toList();
  }
}
