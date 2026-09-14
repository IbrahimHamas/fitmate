import 'package:fit_up/core/themes/app_color.dart';
import 'package:fit_up/features/Profile/presentation/view/edit_profile_screen.dart';
import 'package:fit_up/features/profile/data/models/profile_model.dart';
import 'package:fit_up/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:fit_up/features/profile/presentation/view_model/profile_state.dart';
import 'package:fit_up/features/profile/presentation/widgets/profile_header.dart';
import 'package:fit_up/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:fit_up/features/profile/presentation/widgets/profile_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfileError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: AppColor.danger),
              ),
            );
          }

          // Dummy model for preview if state is Initial/Empty
          final profile = (state is ProfileSuccess)
              ? state.profile
              : (state is ProfileUpdated)
              ? state.profile
              : const ProfileModel(
                  fullName: 'Alex Rivera',
                  email: 'alex.rivera@example.com',
                  phoneNumber: '+1 (555) 123-4567',
                  plansCompleted: 5,
                  workoutHours: 120,
                );

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Profile Header Widget
                Center(
                  child: ProfileHeader(
                    name: profile.fullName,
                    email: profile.email,
                    imageUrl: profile.profileImage,
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditProfileScreen(profile: profile),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // 2. Statistics Section (5 Plans & 120 Hours)
                Row(
                  children: [
                    ProfileStatCard(
                      title: 'Plans',
                      value: profile.plansCompleted.toString(),
                      label: 'Completed',
                    ),
                    const SizedBox(width: 12),
                    ProfileStatCard(
                      title: 'Hours',
                      value: profile.workoutHours.toString(),
                      label: 'Trained',
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 3. Account Settings Section
                Text(
                  'Account Settings',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColor.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                ProfileMenuItem(
                  icon: Icons.notifications_none_rounded,
                  title: 'Notifications',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.lock_outline_rounded,
                  title: 'Privacy & Security',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.language_rounded,
                  title: 'Language',
                  trailingText: 'English',
                  onTap: () {},
                ),
                const Divider(height: 32),
                ProfileMenuItem(
                  icon: Icons.logout_rounded,
                  title: 'Log Out',
                  isLogout: true,
                  onTap: () {
                    // Sign-out action handling
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
