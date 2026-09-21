import 'package:fitmate/core/features/work_out_plans/data/data_sources/work_out_plans_remote_data_sources.dart';
import 'package:fitmate/core/features/work_out_plans/data/repos/work_out_plans_repository.dart';
import 'package:fitmate/core/features/work_out_plans/presentation/view_model/cubit/work_out_plans_cubit.dart';
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
  /*
  // Profile Data Source (بدون arguments)
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSource(),
  );

  // Profile Repository
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(
      sl<ProfileRemoteDataSource>(),
      supabaseClient: sl<SupabaseClient>(),
    ),
  );

  // Profile Cubit
  sl.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      repository: sl<ProfileRepository>(),
      supabaseClient: sl<SupabaseClient>(),
    ),
  );
  */
}
