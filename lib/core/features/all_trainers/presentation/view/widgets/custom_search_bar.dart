 
import 'package:fitmate/core/features/all_trainers/presentation/view_model/cubit/trainers_cubit.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const CustomSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        height: 43.h,
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(9.r),
        ),
        child: TextField(
          controller: controller,
          onChanged: (value) {
            context.read<TrainersCubit>().searchTrainers(value);
          },
          style: TextStyle(color: AppColor.textPrimary, fontSize: 12.sp),
          cursorColor: AppColor.primary,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: AppColor.textSecondary,
              size: 19.sp,
            ),
            hintText: 'Search by name or specialty',
            hintStyle: TextStyle(color: AppColor.hint, fontSize: 12.sp),
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          ),
        ),
      ),
    );
  }
}
