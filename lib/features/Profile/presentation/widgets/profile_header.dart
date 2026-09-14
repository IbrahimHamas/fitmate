import 'package:fit_up/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? imageUrl;
  final VoidCallback onEdit;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.imageUrl,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 44,
          backgroundColor: AppColor.surfaceElevated,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child: imageUrl == null
              ? const Icon(
                  Icons.person,
                  size: 44,
                  color: AppColor.textSecondary,
                )
              : null,
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColor.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColor.textSecondary),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 140,
          height: 40,
          child: OutlinedButton(
            onPressed: onEdit,
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColor.surfaceElevated,
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
