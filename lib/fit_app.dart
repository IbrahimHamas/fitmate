import 'package:fitmate/core/routing/app_router.dart';
import 'package:fitmate/core/routing/navigator_key.dart' show NavigatorKey;
import 'package:fitmate/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class FitApp extends StatelessWidget {
  const FitApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });

  final AppRouter appRouter;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      navigatorKey: NavigatorKey.navigatorKey,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
