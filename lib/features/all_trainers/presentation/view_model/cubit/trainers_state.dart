import 'package:fitmate/features/all_trainers/data/models/trainer_model.dart';

abstract class TrainersState {
  const TrainersState();
}

class TrainersInitial extends TrainersState {
  const TrainersInitial();
}

class TrainersLoading extends TrainersState {
  const TrainersLoading();
}

class TrainersSuccess extends TrainersState {
  final List<TrainerModel> trainers;

  const TrainersSuccess(this.trainers);
}

class TrainersError extends TrainersState {
  final String message;

  const TrainersError(this.message);
}
