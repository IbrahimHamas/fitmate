import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/features/all_trainers/presentation/view_model/cubit/trainers_cubit.dart';
import 'package:fitmate/core/common/responsive/responsive.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const CustomSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive.width(context, 12)),
      child: Container(
        height: Responsive.height(context, 43),
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(Responsive.radius(context, 9)),
        ),
        child: TextField(
          controller: controller,
          onChanged: (value) {
            context.read<TrainersCubit>().searchTrainers(value);
          },
          style: TextStyle(
            color: AppColor.textPrimary,
            fontSize: Responsive.font(context, 12),
          ),
          cursorColor: AppColor.primary,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: AppColor.textSecondary,
              size: Responsive.font(context, 19),
            ),
            hintText: AppStrings.searchByNameOrSpecialty,
            hintStyle: TextStyle(
              color: AppColor.hint,
              fontSize: Responsive.font(context, 12),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: Responsive.height(context, 12),
            ),
          ),
        ),
      ),
    );
  }
}
