import 'package:fitmate/core/routing/app_router.dart';
import 'package:fitmate/core/routing/navigator_key.dart';
import 'package:fitmate/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class FitApp extends StatelessWidget {
  const FitApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      navigatorKey: NavigatorKey.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
