import 'package:fitmate/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: textTheme.titleLarge!)),
          Expanded(
            child: Text(
              actionText,
              textAlign: TextAlign.end,
              style: textTheme.labelMedium!.copyWith(color: AppColor.primary),
            ),
          ),
        ],
      ),
    );
  }
}
