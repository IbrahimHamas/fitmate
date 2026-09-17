import 'package:fitmate/core/services/shared_preferences_service.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // External & Core Services
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(),
  );
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
