import 'package:fitmate/core/features/all_trainers/data/data_sources/all_trainers_remote_data_source.dart';
import 'package:fitmate/core/features/all_trainers/data/repos/trainers_repository.dart';
import 'package:fitmate/core/features/all_trainers/presentation/view_model/cubit/trainers_cubit.dart';
import 'package:fitmate/core/features/work_out_plans/data/repos/work_out_plans_repository.dart';
import 'package:fitmate/core/features/work_out_plans/presentation/view_model/cubit/work_out_plans_cubit.dart';
import 'package:fitmate/core/networking/supabase_helper.dart';
import 'package:fitmate/core/features/work_out_plans/data/data_sources/work_out_plans_remote_data_sources.dart';
import 'package:fitmate/core/services/shared_preferences_service.dart';
import 'package:fitmate/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:fitmate/features/auth/data/repositories/auth_repository.dart';
import 'package:fitmate/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // External & Core Services
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton<SupabaseHelper>(() => SupabaseHelper());
  sl.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(),
  );

  sl.registerLazySingleton<WorkoutPlansRemoteDataSource>(
    () => WorkoutPlansRemoteDataSource(sl<SupabaseClient>()),
  );
  sl.registerLazySingleton<WorkoutPlansRepository>(
    () => WorkoutPlansRepository(sl<WorkoutPlansRemoteDataSource>()),
  );
  sl.registerFactory<WorkoutPlansCubit>(
    () => WorkoutPlansCubit(sl<WorkoutPlansRepository>()),
  );

  sl.registerLazySingleton<AllTrainersRemoteDataSource>(
    () => AllTrainersRemoteDataSource(sl<SupabaseHelper>()),
  );
  sl.registerLazySingleton<TrainersRepository>(
    () =>
        TrainersRepository(remoteDataSource: sl<AllTrainersRemoteDataSource>()),
  );
  sl.registerFactory<TrainersCubit>(
    () => TrainersCubit(repository: sl<TrainersRepository>()),
  );

 
  if (!sl.isRegistered<AuthRemoteDataSource>()) {
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(sl()),
    );
  }
  if (!sl.isRegistered<AuthRepository>()) {
    sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl()));
  }
  if (!sl.isRegistered<AuthCubit>()) {
    sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
  }
}
