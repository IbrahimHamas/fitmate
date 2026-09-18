import 'package:fitmate/core/routing/routes.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:fitmate/features/profile/data/models/profile_model.dart';
import 'package:fitmate/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:fitmate/features/profile/presentation/view_model/profile_state.dart';
import 'package:fitmate/features/profile/presentation/widgets/profile_header.dart';
import 'package:fitmate/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:fitmate/features/profile/presentation/widgets/profile_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColor.surfaceElevated,
        title: const Text(
          'Log Out',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'Are you sure you want to log out?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              await context.read<ProfileCubit>().signOut();
            },
            child: const Text('Log Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoggedOut) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.welcome,
            (route) => false,
          );
        } else if (state is ProfileError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final ProfileModel? currentProfile = (state is ProfileSuccess)
            ? state.profile
            : null;

        return Scaffold(
          backgroundColor: AppColor.background,
          appBar: AppBar(
            backgroundColor: AppColor.background,
            title: const Text('Profile', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // ممررين الصورة والبيانات للـ Header
                ProfileHeader(
                  name: currentProfile?.fullName ?? '',
                  email: currentProfile?.email ?? '',
                  imageUrl:
                      currentProfile?.profileImage, // لو الموديل فيه imageUrl
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
                        title: 'Workouts',
                        value: '${currentProfile?.plansCompleted ?? 12}',
                        label: '',
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: ProfileStatCard(
                        title: 'Calories',
                        value: '1,450',
                        label: '',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ProfileStatCard(
                        title: 'Time (hrs)',
                        value: '${currentProfile?.workoutHours ?? 8.5}',
                        label: '',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ProfileMenuItem(
                  icon: Icons.person_outline,
                  title: 'Edit Profile',
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
                  title: 'Settings',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.logout_rounded,
                  title: 'Log Out',
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
