import 'package:fitmate/features/profile/data/models/profile_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileModel profile;
  ProfileSuccess(this.profile);
}

class ProfileUpdating extends ProfileState {
  final ProfileModel profile;
  ProfileUpdating(this.profile);
}

class ProfileUpdated extends ProfileState {
  final ProfileModel profile;
  ProfileUpdated(this.profile);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

class ProfileLoggedOut extends ProfileState {}
