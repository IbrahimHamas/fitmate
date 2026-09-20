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
