import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/core/dependency_injection/injection_container.dart';
import 'package:fitmate/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:fitmate/features/auth/presentation/view_model/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitmate/core/extensions/snack_bar_context_extension.dart';
import 'package:fitmate/core/routing/routes.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:fitmate/features/profile/data/models/profile_model.dart';
import 'package:fitmate/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:fitmate/features/profile/presentation/view_model/profile_state.dart';
import 'package:fitmate/features/profile/presentation/view/widgets/profile_header.dart';
import 'package:fitmate/features/profile/presentation/view/widgets/profile_menu_item.dart';
import 'package:fitmate/features/profile/presentation/view/widgets/profile_stat_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _showLogoutDialog(BuildContext context) async {
    final loggedOut = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => BlocProvider(
        create: (_) => sl<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (dialogContext, state) {
            if (state is SignOutSuccess) {
              Navigator.of(dialogContext).pop(true);
            }
          },
          builder: (dialogContext, state) {
            final isLoading = state is SignOutLoading;
            return PopScope(
              canPop: !isLoading,
              child: AlertDialog(
                backgroundColor: AppColor.surfaceElevated,
                title: const Text(
                  AppStrings.logOut,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      AppStrings.confirmLogOut,
                      style: TextStyle(color: Colors.white70),
                    ),
                    if (isLoading) ...[
                      const SizedBox(height: 16),
                      const CircularProgressIndicator(),
                    ],
                    if (state is SignOutFailure) ...[
                      const SizedBox(height: 16),
                      Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () => Navigator.pop(dialogContext),
                    child: const Text(
                      AppStrings.cancel,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () => dialogContext.read<AuthCubit>().signOut(),
                    child: const Text(
                      AppStrings.logOut,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
    if (loggedOut != true || !context.mounted) return;
    context.showSuccessSnackBar(AppStrings.loggedOutSuccessfully);
    Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          context.showErrorSnackBar(state.message);
        }
      },
      builder: (context, state) {
        final ProfileModel? currentProfile = (state is ProfileSuccess)
            ? state.profile
            : null;

        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.profile),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProfileHeader(
                  name: currentProfile?.fullName ?? '',
                  email: currentProfile?.email ?? '',
                  imageUrl: currentProfile?.profileImage,
                  onEdit: () {
                    Navigator.pushNamed(
                      context,
                      Routes.editProfile,
                      arguments: currentProfile,
                    );
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ProfileStatCard(
                        title: AppStrings.workouts,
                        value: '${currentProfile?.plansCompleted ?? 12}',
                        label: '',
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: ProfileStatCard(
                        title: AppStrings.calories,
                        value: AppStrings.sampleCalories,
                        label: '',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ProfileStatCard(
                        title: AppStrings.timeHours,
                        value: '${currentProfile?.workoutHours ?? 8.5}',
                        label: '',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ProfileMenuItem(
                  icon: Icons.person_outline,
                  title: AppStrings.editProfile,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.editProfile,
                      arguments: currentProfile,
                    );
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.settings_outlined,
                  title: AppStrings.settings,
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.logout_rounded,
                  title: AppStrings.logOut,
                  isLogout: true,
                  onTap: () => _showLogoutDialog(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
