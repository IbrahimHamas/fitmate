import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoute.onboarding:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => BlocProvider(
      //       create: (_) => OnboardingCubit(),
      //       child: const OnboardingView(),
      //     ),
      //   );
      default:
        return null;
    }
  }
}
