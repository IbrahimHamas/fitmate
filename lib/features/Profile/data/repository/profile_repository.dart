import 'package:fit_up/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:fit_up/features/profile/data/models/profile_model.dart';

class ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepository(this.remoteDataSource);

  Future<ProfileModel> getProfile() {
    return remoteDataSource.getProfile();
  }

  Future<ProfileModel> updateProfile(ProfileModel profile) {
    return remoteDataSource.updateProfile(profile);
  }
}
