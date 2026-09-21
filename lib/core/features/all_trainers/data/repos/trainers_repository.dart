import 'package:dartz/dartz.dart';
import 'package:fitmate/core/services/errors/failure.dart';
import 'package:fitmate/core/services/request_handler.dart';
import '../data_sources/all_trainers_remote_data_source.dart';
import '../models/trainer_model.dart';

class TrainersRepository {
  final AllTrainersRemoteDataSource remoteDataSource;

  TrainersRepository({required this.remoteDataSource});

  Future<Either<Failure, List<TrainerModel>>> getTrainers() =>
      requestHandler(remoteDataSource.getTrainers);
}
