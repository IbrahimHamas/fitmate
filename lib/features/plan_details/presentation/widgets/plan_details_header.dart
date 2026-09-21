import 'dart:ui';

import 'package:fitmate/core/themes/app_color.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';

class PlanDetailsHeader extends StatelessWidget implements PreferredSizeWidget {
  final TextTheme textTheme;
  const PlanDetailsHeader({super.key, required this.textTheme});

  @override
  Size get preferredSize => Size.fromHeight(73);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0x101922CC),
            border: Border(
              bottom: BorderSide(width: 1, color: Color(0xFF1E293B)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedIconButton(
                color: AppColor.surfaceElevated,
                onTap: () {},
                icon: Icons.arrow_back,
                size: 16,
              ),
              Text(
                "Plan Details",
                textAlign: TextAlign.center,
                style: textTheme.titleMedium!.copyWith(
                  height: 1.25,
                  letterSpacing: -0.45,
                ),
              ),
              RoundedIconButton(
                color: AppColor.primary.withValues(alpha: 0.10),
                onTap: () {},
                icon: Icons.favorite_border,
                size: 20,
                iconColor: AppColor.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
