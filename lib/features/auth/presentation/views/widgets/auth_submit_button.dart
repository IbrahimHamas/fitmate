import 'package:fitmate/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.gradient = false,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool gradient;
  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppTheme.buttonRadius),
      gradient: gradient && !isLoading && onPressed != null
          ? AppTheme.primaryButtonGradient
          : null,
      boxShadow: isLoading ? null : AppTheme.primaryButtonShadows,
    ),
    child: SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: gradient
            ? FilledButton.styleFrom(backgroundColor: Colors.transparent)
            : null,
        child: isLoading
            ? SizedBox.square(
                dimension: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.onPrimary,
                  semanticsLabel: 'Please wait',
                ),
              )
            : Text(label),
      ),
    ),
  );
}
