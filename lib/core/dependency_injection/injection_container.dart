import 'package:fitmate/core/features/all_trainers/data/repos/trainers_repository.dart';
import 'package:fitmate/core/features/all_trainers/presentation/view_model/cubit/trainers_cubit.dart';
import 'package:fitmate/core/features/work_out_plans/data/repos/work_out_plans_repository.dart';
import 'package:fitmate/core/features/work_out_plans/presentation/view_model/cubit/work_out_plans_cubit.dart';
import 'package:fitmate/core/networking/supabase_helper.dart';
import 'package:fitmate/core/services/shared_preferences_service.dart';
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

  sl.registerLazySingleton<WorkoutPlansRepository>(
    () => WorkoutPlansRepository(sl<SupabaseClient>()),
  );
  sl.registerFactory<WorkoutPlansCubit>(
    () => WorkoutPlansCubit(sl<WorkoutPlansRepository>()),
  );

  sl.registerLazySingleton<TrainersRepository>(
    () => TrainersRepository(supabaseHelper: sl<SupabaseHelper>()),
  );
  sl.registerFactory<TrainersCubit>(
    () => TrainersCubit(repository: sl<TrainersRepository>()),
  );
}
