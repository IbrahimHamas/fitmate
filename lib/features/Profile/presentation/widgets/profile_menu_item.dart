import 'package:fit_up/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;
  final VoidCallback? onTap;
  final bool isLogout;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        color: isLogout ? AppColor.danger : AppColor.textSecondary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isLogout ? AppColor.danger : AppColor.textPrimary,
        ),
      ),
      trailing: trailingText != null
          ? Text(
              trailingText!,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColor.hint),
            )
          : const Icon(Icons.chevron_right, color: AppColor.hint, size: 20),
    );
  }
}
