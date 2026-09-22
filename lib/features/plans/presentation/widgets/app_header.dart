import 'dart:ui';

import 'package:fitmate/core/themes/app_color.dart';
import 'package:fitmate/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  static const double _height = 69;

  @override
  Size get preferredSize => Size.fromHeight(_height);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: double.infinity,
          height: _height,
          padding: EdgeInsets.only(right: 16, left: 16, top: 16),
          decoration: BoxDecoration(
            // color: Color(0x101922CC),
            border: Border(
              bottom: BorderSide(width: 1, color: AppColor.surfaceElevated),
            ),
          ),
          child: Row(
            children: [
              Image.asset("assets/images/flash.png", width: 20, height: 25),
              SizedBox(width: 8),
              SizedBox(
                width: 119.13,
                height: 28,
                child: Text(
                  "IronPulse".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: AppTheme.darkTheme.textTheme.titleLarge!.copyWith(
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              Spacer(),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    "assets/images/notification.png",
                    width: 16,
                    height: 20,
                  ),

                  Positioned(
                    top: -1,
                    right: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
