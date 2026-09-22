import 'dart:io';

import 'package:fitmate/features/profile/data/models/profile_model.dart';

class ProfileRemoteDataSource {
  ProfileRemoteDataSource();
  Future<ProfileModel> getProfile() async {
    throw UnimplementedError('Profile Supabase table is not configured yet.');
  }

  Future<ProfileModel> updateProfile(
    ProfileModel profile, {
    File? imageFile,
  }) async {
    throw UnimplementedError('Profile Supabase table is not configured yet.');
  }
}
