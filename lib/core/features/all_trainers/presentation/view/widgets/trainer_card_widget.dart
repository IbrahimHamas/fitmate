import 'package:fitmate/core/features/all_trainers/data/models/trainer_model.dart';
import 'package:fitmate/core/common/responsive/responsive.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

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
      margin: EdgeInsets.only(bottom: Responsive.height(context, 12)),
      padding: EdgeInsets.all(Responsive.width(context, 12)),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(Responsive.radius(context, 10)),
        border: Border.all(color: AppColor.outlineSoft),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileImage(context),
          SizedBox(width: Responsive.width(context, 12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndRating(context),
                SizedBox(height: Responsive.height(context, 3)),
                Text(
                  trainer.specialty,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: blueColor,
                    fontSize: Responsive.font(context, 12),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Responsive.height(context, 8)),
                _buildInfoRow(context),
                SizedBox(height: Responsive.height(context, 8)),
                _buildProfileButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Responsive.radius(context, 7)),
      child: SizedBox(
        width: Responsive.width(context, 68),
        height: Responsive.height(context, 68),
        child: trainer.imageUrl.isEmpty
            ? Container(
                color: AppColor.surfaceElevated,
                child: Icon(
                  Icons.person,
                  color: AppColor.textSecondary,
                  size: Responsive.font(context, 30),
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
                      size: Responsive.font(context, 30),
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
                      width: Responsive.width(context, 18),
                      height: Responsive.height(context, 18),
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

  Widget _buildNameAndRating(BuildContext context) {
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
        SizedBox(width: Responsive.width(context, 6)),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.width(context, 6),
            vertical: Responsive.height(context, 3),
          ),
          decoration: BoxDecoration(
            color: AppColor.primaryContainer,
            borderRadius: BorderRadius.circular(Responsive.radius(context, 4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: blueColor,
                size: Responsive.font(context, 11),
              ),
              SizedBox(width: Responsive.width(context, 2)),
              Text(
                trainer.rating.toStringAsFixed(1),
                style: TextStyle(
                  color: blueColor,
                  fontSize: Responsive.font(context, 10),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time_outlined,
          color: secondaryTextColor,
          size: Responsive.font(context, 13),
        ),
        SizedBox(width: Responsive.width(context, 3)),
        Text(
          '${trainer.yearsExp} yrs exp',
          style: TextStyle(
            color: secondaryTextColor,
            fontSize: Responsive.font(context, 9.5),
          ),
        ),
        SizedBox(width: Responsive.width(context, 12)),
        Icon(
          Icons.people_outline,
          color: secondaryTextColor,
          size: Responsive.font(context, 13),
        ),
        SizedBox(width: Responsive.width(context, 3)),
        Text(
          '${trainer.clientsCount}+ clients',
          style: TextStyle(
            color: secondaryTextColor,
            fontSize: Responsive.font(context, 9.5),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileButton(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.width(context, 10),
          vertical: Responsive.height(context, 6),
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(Responsive.radius(context, 6)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'View Profile',
              style: TextStyle(
                color: AppColor.textPrimary,
                fontSize: Responsive.font(context, 10),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: Responsive.width(context, 4)),
            Icon(
              Icons.chevron_right,
              color: AppColor.textSecondary,
              size: Responsive.font(context, 14),
            ),
          ],
        ),
      ),
    );
  }
}
