import 'package:dartz/dartz.dart';
import 'package:fitmate/features/work_out_plans/data/models/work_out_plans_model.dart';
import 'package:fitmate/core/services/errors/failure.dart';
import 'package:fitmate/core/services/request_handler.dart';

import '../data_sources/work_out_plans_remote_data_sources.dart';

class WorkoutPlansRepository {
  final WorkoutPlansRemoteDataSource _remoteDataSource;

  WorkoutPlansRepository(this._remoteDataSource);

  Future<Either<Failure, List<WorkoutPlanModel>>> getWorkoutPlans() =>
      requestHandler(_remoteDataSource.getWorkoutPlans);
}
