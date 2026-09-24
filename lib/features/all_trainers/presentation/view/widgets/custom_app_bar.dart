import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/core/common/responsive/responsive.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.height(context, 62),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.width(context, 16),
        ),
        child: Row(
          children: [
            SizedBox(width: Responsive.width(context, 18)),
            Text(
              AppStrings.trainers,
              style: TextStyle(
                color: AppColor.textPrimary,
                fontSize: Responsive.font(context, 16),
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(
              AppStrings.appName,
              style: TextStyle(
                color: AppColor.primary,
                fontSize: Responsive.font(context, 11),
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
