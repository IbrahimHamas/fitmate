import 'package:fitmate/core/dependency_injection/injection_container.dart';
import 'package:fitmate/core/networking/supabase_helper.dart';
import 'package:fitmate/core/routing/app_router.dart';
import 'package:fitmate/core/routing/routes.dart';
import 'package:fitmate/fit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  await SupabaseHelper.init();

  await initDependencies();

  runApp(FitApp(appRouter: AppRouter(), initialRoute: Routes.home));
  FlutterNativeSplash.remove();
}
