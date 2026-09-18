import 'package:fitmate/core/config/supabase_config.dart';
import 'package:fitmate/core/dependency_injection/injection_container.dart';
import 'package:fitmate/core/routing/routes.dart';
import 'package:fitmate/fit_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase & Dependency Injection
  await SupabaseConfig.init();
  await initDependencies();

  runApp(const FitApp(initialRoute: Routes.welcome));
}
