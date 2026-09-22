import 'package:fitmate/core/networking/supabase_helper.dart';

import '../models/trainer_model.dart';

class AllTrainersRemoteDataSource {
  const AllTrainersRemoteDataSource(this._supabaseHelper);

  final SupabaseHelper _supabaseHelper;

  Future<List<TrainerModel>> getTrainers() async {
    final response = await _supabaseHelper.getData(tableName: 'trainers');

    return (response as List)
        .map(
          (trainer) =>
              TrainerModel.fromJson(Map<String, dynamic>.from(trainer)),
        )
        .toList();
  }
}
