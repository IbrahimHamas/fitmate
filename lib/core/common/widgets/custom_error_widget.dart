import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/core/common/responsive/responsive.dart';
import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final void Function()? onPressed;
  const CustomErrorWidget({
    super.key,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Responsive.width(context, 24)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: AppColor.danger,
              size: Responsive.font(context, 40),
            ),
            SizedBox(height: Responsive.height(context, 10)),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.textBody,
                fontSize: Responsive.font(context, 13),
              ),
            ),
            SizedBox(height: Responsive.height(context, 14)),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text(AppStrings.retry),
            ),
          ],
        ),
      ),
    );
  }
}
