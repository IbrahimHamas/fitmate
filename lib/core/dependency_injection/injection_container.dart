import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitmate/core/services/shared_preferences_service.dart';
import 'package:fitmate/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:fitmate/features/profile/data/repository/profile_repository.dart';
import 'package:fitmate/features/profile/presentation/view_model/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // External & Core Services
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(),
  );

  // Profile Data Source
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSource(),
  );

  // Profile Repository (تمرير remoteDataSource فقط بدون supabaseClient)
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(remoteDataSource: sl<ProfileRemoteDataSource>()),
  );

  // Profile Cubit
  sl.registerFactory<ProfileCubit>(
    () => ProfileCubit(profileRepository: sl<ProfileRepository>()),
  );
}
