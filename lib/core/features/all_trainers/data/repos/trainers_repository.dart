import 'package:dartz/dartz.dart';
import 'package:fitmate/core/services/errors/failure.dart';
import 'package:fitmate/core/services/request_handler.dart';
import 'package:fitmate/core/networking/supabase_helper.dart';


import '../models/trainer_model.dart';

class TrainersRepository {
  final SupabaseHelper supabaseHelper;

  TrainersRepository({required this.supabaseHelper});

  Future<Either<Failure, List<TrainerModel>>> getTrainers() async {
    return requestHandler(() async {
      final response = await supabaseHelper.getData(tableName: 'trainers');

      return (response as List)
          .map(
            (trainer) =>
                TrainerModel.fromJson(Map<String, dynamic>.from(trainer)),
          )
          .toList();
    });
  }
}
