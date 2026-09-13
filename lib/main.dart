import 'package:fit_up/core/dependency_injection/injection_container.dart';
import 'package:fit_up/core/networking/supabase_helper.dart';
import 'package:fit_up/core/routing/app_router.dart';
import 'package:fit_up/fit_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseHelper.init();
  await initDependencies();
  runApp(FitApp(appRouter: AppRouter(), initialRoute: AppRouter.welcome));
}
