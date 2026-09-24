import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/core/common/responsive/responsive.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.noTrainersFound,
        style: TextStyle(
          color: AppColor.textBody,
          fontSize: Responsive.font(context, 14),
        ),
      ),
    );
  }
}
