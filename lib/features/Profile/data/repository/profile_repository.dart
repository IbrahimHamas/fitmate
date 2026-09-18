import 'package:fitmate/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:fitmate/features/profile/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final SupabaseClient supabaseClient;

  ProfileRepository(this.remoteDataSource, {required this.supabaseClient});

  Future<ProfileModel> getProfile() {
    return remoteDataSource.getProfile();
  }

  Future<ProfileModel> updateProfile(ProfileModel profile) {
    return remoteDataSource.updateProfile(profile);
  }
}
