
import 'package:fitmate/core/features/all_trainers/presentation/view_model/cubit/trainers_cubit.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: AppColor.danger, size: 40.sp),
            SizedBox(height: 10.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.textBody, fontSize: 13.sp),
            ),
            SizedBox(height: 14.h),
            ElevatedButton(
              onPressed: () {
                context.read<TrainersCubit>().fetchTrainers();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
