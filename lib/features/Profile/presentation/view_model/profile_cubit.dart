import 'package:fitmate/features/profile/data/models/profile_model.dart';
import 'package:fitmate/features/profile/data/repository/profile_repository.dart';
import 'package:fitmate/features/profile/presentation/view_model/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;
  final SupabaseClient supabaseClient;

  ProfileCubit({required this.repository, required this.supabaseClient})
    : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    try {
      final profile = await repository.getProfile();
      emit(ProfileSuccess(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile(ProfileModel profile) async {
    // 1. إظهار حالة النجاح فوراً بالتحديث المحلي (Optimistic UI Update)
    emit(ProfileSuccess(profile));

    try {
      // 2. تحديث البيانات في الـ Repository أو Supabase
      final updatedProfile = await repository.updateProfile(profile);

      // 3. تأكيد التحديث النهائي بالبيانات القادمة من السيرفر
      emit(ProfileSuccess(updatedProfile));
    } catch (e) {
      // في حالة الفشل نرجع الـ Error لكن نفضل تحت الحفظ
      emit(ProfileError('Failed to save: ${e.toString()}'));
    }
  }

  Future<void> signOut() async {
    emit(ProfileLoading());
    try {
      await supabaseClient.auth.signOut();
      emit(ProfileLoggedOut());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
