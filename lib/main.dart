import 'package:fitmate/core/config/supabase_config.dart';
import 'package:fitmate/core/dependency_injection/injection_container.dart';
import 'package:fitmate/core/routing/app_router.dart';
import 'package:fitmate/core/routing/routes.dart';
import 'package:fitmate/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.init();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(390, 884),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.welcome,
      ),
    );
  }
}
