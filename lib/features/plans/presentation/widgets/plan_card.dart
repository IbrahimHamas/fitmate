import 'dart:ui';

import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            color: Color(0XFF1E293B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                width: 1,
                color: Color(0x00000000),
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: AspectRatio(
                    aspectRatio: 1.6,
                    child: Image.asset(
                      "assets/images/alpha-strength.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Alpha Strength",
                          style: textTheme.titleLarge,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.star_border_outlined,
                        size: 11.67,
                        color: AppColor.rating,
                      ),
                      SizedBox(width: 4),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "4.9",
                          style: textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 12,
                        color: AppColor.textSecondary,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "8 Weeks",
                        style: textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.textSecondary,
                        ),
                      ),
                      SizedBox(width: 16),
                      Icon(
                        Icons.timer_outlined,
                        size: 12,
                        color: AppColor.textSecondary,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "60 Min/Day",
                        style: textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3.5, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xE50D7FF2),
                ),
                child: Text(
                  "Advanced".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall!.copyWith(
                    fontSize: 12,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
