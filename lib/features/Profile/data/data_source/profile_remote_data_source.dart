import 'package:fit_up/features/profile/data/models/profile_model.dart';

class ProfileRemoteDataSource {
  ProfileRemoteDataSource();
  Future<ProfileModel> getProfile() async {
    throw UnimplementedError('Profile Supabase table is not configured yet.');
  }

  Future<ProfileModel> updateProfile(ProfileModel profile) async {
    throw UnimplementedError('Profile Supabase table is not configured yet.');
  }
}
