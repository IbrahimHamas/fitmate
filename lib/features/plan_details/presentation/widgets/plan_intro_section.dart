import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:fitmate/features/plan_details/presentation/widgets/info_badge.dart';
import 'package:flutter/material.dart';

class PlanIntroSection extends StatelessWidget {
  const PlanIntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              InfoBadge(
                textTheme: textTheme,
                text: AppStrings.advanced,
                color: AppColor.primary,
              ),
              SizedBox(width: 8),
              InfoBadge(
                textTheme: textTheme,
                text: AppStrings.eightWeeks,
                color: AppColor.secondary,
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          alignment: Alignment.centerLeft,
          child: Text(
            AppStrings.ironPulseStrengthPhase,
            maxLines: 2,
            textHeightBehavior: TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            style: textTheme.headlineLarge!.copyWith(fontSize: 30),
          ),
        ),
        SizedBox(height: 7.3),
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 24, right: 24, top: 0.7),
          constraints: BoxConstraints(maxWidth: 448),
          child: Text(
            AppStrings.strengthPhaseDescription,
            style: textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColor.textBody,
            ),
          ),
        ),
      ],
    );
  }
}
