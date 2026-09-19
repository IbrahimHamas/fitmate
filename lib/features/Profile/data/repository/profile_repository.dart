import 'dart:io';
import 'package:fitmate/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:fitmate/features/profile/data/models/profile_model.dart';

class ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepository({required this.remoteDataSource});

  Future<ProfileModel> getProfile() {
    return remoteDataSource.getProfile();
  }

  Future<ProfileModel> updateProfile(ProfileModel profile, {File? imageFile}) {
    return remoteDataSource.updateProfile(profile, imageFile: imageFile);
  }
}
