import 'package:fit_up/features/profile/data/models/profile_model.dart';
import 'package:fit_up/features/profile/data/repository/profile_repository.dart';
import 'package:fit_up/features/profile/presentation/view_model/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(const ProfileInitial());

  Future<void> getProfile() async {
    emit(const ProfileLoading());
    try {
      final profile = await repository.getProfile();
      emit(ProfileSuccess(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile(ProfileModel profile) async {
    emit(ProfileUpdating(profile));
    try {
      final updatedProfile = await repository.updateProfile(profile);
      emit(ProfileUpdated(updatedProfile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
