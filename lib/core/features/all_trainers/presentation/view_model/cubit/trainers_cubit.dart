import 'package:fitmate/core/features/all_trainers/data/models/trainer_model.dart';
import 'package:fitmate/core/features/all_trainers/data/repos/trainers_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'trainers_state.dart';

class TrainersCubit extends Cubit<TrainersState> {
  final TrainersRepository repository;

  TrainersCubit({required this.repository}) : super(const TrainersInitial());

  List<TrainerModel> _allTrainers = [];

  Future<void> fetchTrainers() async {
    emit(const TrainersLoading());

    try {
     final result = await repository.getTrainers();

result.fold(
  (failure) {
    // print('Supabase Error Message: ${failure.message}'); 
    emit(TrainersError(failure.message));
  },
  (trainers) {
    _allTrainers = trainers;
    emit(TrainersSuccess(List<TrainerModel>.from(_allTrainers)));
  },
);
    } on PostgrestException catch (e) {
  // print('Postgrest Error Code: ${e.code}');
  // print('Postgrest Error Message: ${e.message}');
  // print('Postgrest Error Details: ${e.details}');
  rethrow;
}
  }
  

  void searchTrainers(String query) {
    if (query.trim().isEmpty) {
      emit(TrainersSuccess(List<TrainerModel>.from(_allTrainers)));

      return;
    }

    final searchQuery = query.trim().toLowerCase();

    final filteredTrainers = _allTrainers.where((trainer) {
      final name = trainer.name.toLowerCase();
      final specialty = trainer.specialty.toLowerCase();

      return name.contains(searchQuery) || specialty.contains(searchQuery);
    }).toList();

    emit(TrainersSuccess(filteredTrainers));
  }
}
