  import 'package:fitmate/core/features/all_trainers/presentation/view_model/cubit/trainers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void fetchtraniers(BuildContext context) {
      context.read<TrainersCubit>().fetchTrainers();
  }