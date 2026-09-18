 import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No trainers found',
        style: TextStyle(color: AppColor.textBody, fontSize: 14.sp),
      ),
    );
  }
}
