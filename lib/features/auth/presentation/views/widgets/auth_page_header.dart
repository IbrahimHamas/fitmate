import 'package:fitmate/core/constants/app_image.dart';
import 'package:fitmate/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class AuthPageHeader extends StatelessWidget {
  const AuthPageHeader({super.key, this.isSignUp = false});
  final bool isSignUp;
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: isSignUp ? 358 / 272 : 712 / 436,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(AppImage.gym, fit: BoxFit.cover),
              if (isSignUp)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Text(
                      AppStrings.joinToTheForge,
                      textAlign: TextAlign.center,
                      style: text.displayMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (!isSignUp) ...[
          const SizedBox(height: 24),
          Text(
            AppStrings.welcomeBack,
            textAlign: TextAlign.center,
            style: text.headlineLarge,
          ),
          const SizedBox(height: 12),
        ],
        Text(
          isSignUp
              ? AppStrings.startYourTransformationJourneyToday
              : AppStrings.fuelYourProgressLogInToYourPulse,
          textAlign: TextAlign.center,
          style: text.bodyLarge?.copyWith(
            color: isSignUp
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
