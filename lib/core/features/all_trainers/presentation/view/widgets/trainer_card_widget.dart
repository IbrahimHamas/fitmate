 
import 'package:fitmate/core/features/all_trainers/data/models/trainer_model.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainerCardWidget extends StatelessWidget {
  final TrainerModel trainer;
  final VoidCallback? onTap;

  const TrainerCardWidget({super.key, required this.trainer, this.onTap});

  static const Color cardColor = AppColor.surface;
  static const Color blueColor = AppColor.primary;
  static const Color buttonColor = AppColor.secondary;
  static const Color secondaryTextColor = AppColor.textSecondary;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColor.outlineSoft),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileImage(),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndRating(),
                SizedBox(height: 3.h),
                Text(
                  trainer.specialty,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: blueColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                _buildInfoRow(),
                SizedBox(height: 8.h),
                _buildProfileButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.r),
      child: SizedBox(
        width: 68.w,
        height: 68.h,
        child: trainer.imageUrl.isEmpty
            ? Container(
                color: AppColor.surfaceElevated,
                child: Icon(
                  Icons.person,
                  color: AppColor.textSecondary,
                  size: 30.sp,
                ),
              )
            : Image.network(
                trainer.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return Container(
                    color: AppColor.surfaceElevated,
                    child: Icon(
                      Icons.person,
                      color: AppColor.textSecondary,
                      size: 30.sp,
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return Container(
                    color: AppColor.surfaceElevated,
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 18.w,
                      height: 18.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: blueColor,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildNameAndRating() {
    return Row(
      children: [
        Expanded(
          child: Text(
            trainer.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColor.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(width: 6.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
          decoration: BoxDecoration(
            color: AppColor.primaryContainer,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: blueColor, size: 11.sp),
              SizedBox(width: 2.w),
              Text(
                trainer.rating.toStringAsFixed(1),
                style: TextStyle(
                  color: blueColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow() {
    return Row(
      children: [
        Icon(
          Icons.access_time_outlined,
          color: secondaryTextColor,
          size: 13.sp,
        ),
        SizedBox(width: 3.w),
        Text(
          '${trainer.yearsExp} yrs exp',
          style: TextStyle(color: secondaryTextColor, fontSize: 9.5.sp),
        ),
        SizedBox(width: 12.w),
        Icon(Icons.people_outline, color: secondaryTextColor, size: 13.sp),
        SizedBox(width: 3.w),
        Text(
          '${trainer.clientsCount}+ clients',
          style: TextStyle(color: secondaryTextColor, fontSize: 9.5.sp),
        ),
      ],
    );
  }

  Widget _buildProfileButton() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'View Profile',
              style: TextStyle(
                color: AppColor.textPrimary,
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(
              Icons.chevron_right,
              color: AppColor.textSecondary,
              size: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
