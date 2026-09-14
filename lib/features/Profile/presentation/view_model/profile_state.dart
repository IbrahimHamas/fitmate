import 'package:fit_up/features/profile/data/models/profile_model.dart';

sealed class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileSuccess extends ProfileState {
  final ProfileModel profile;

  const ProfileSuccess(this.profile);
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);
}

class ProfileUpdating extends ProfileState {
  final ProfileModel profile;

  const ProfileUpdating(this.profile);
}

class ProfileUpdated extends ProfileState {
  final ProfileModel profile;

  const ProfileUpdated(this.profile);
}
