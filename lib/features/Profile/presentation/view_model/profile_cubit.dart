import 'package:fitmate/core/constants/app_strings.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitmate/features/profile/data/models/profile_model.dart';
import 'package:fitmate/features/profile/data/repository/profile_repository.dart';
import 'package:fitmate/features/profile/presentation/view_model/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;

  ProfileCubit({required this.profileRepository}) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    try {
      final profile = await profileRepository.getProfile();
      emit(ProfileSuccess(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile(ProfileModel profile, {File? imageFile}) async {
    emit(ProfileLoading());
    try {
      final updatedProfile = await profileRepository.updateProfile(
        profile,
        imageFile: imageFile,
      );
      emit(ProfileSuccess(updatedProfile));
    } catch (e) {
      emit(ProfileError(AppStrings.failedToSave(e.toString())));
    }
  }
}
