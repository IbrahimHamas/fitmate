import 'package:fitmate/core/constants/app_strings.dart';
import 'dart:io';

import 'package:fitmate/features/profile/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRemoteDataSource {
  ProfileRemoteDataSource(this._client);

  final SupabaseClient _client;

  Future<ProfileModel> getProfile() async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw const AuthException(AppStrings.pleaseSignInToViewYourProfile);
    }

    final metadata = user.userMetadata ?? const <String, dynamic>{};
    return ProfileModel(
      fullName: (metadata['full_name'] ?? metadata['name'] ?? '').toString(),
      email: user.email ?? '',
      phoneNumber: (user.phone ?? metadata['phone_number'] ?? '').toString(),
      profileImage: (metadata['profile_image'] ?? metadata['avatar_url'])
          ?.toString(),
      // Workout statistics need their own backend source.
      plansCompleted: 0,
      workoutHours: 0,
    );
  }

  Future<ProfileModel> updateProfile(
    ProfileModel profile, {
    File? imageFile,
  }) async {
    throw UnimplementedError(AppStrings.profileTableNotConfigured);
  }
}
