import 'package:fit_up/core/classes/auth_state_listener.dart';
import 'package:fit_up/core/dependency_injection/injection_container.dart';
import 'package:fit_up/core/networking/supabase_helper.dart';
import 'package:fit_up/core/routing/navigator_key.dart';
import 'package:fit_up/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseHelper.init();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthStateListener authStateListener;

  @override
  void initState() {
    super.initState();
    authStateListener = AuthStateListener(
      navigatorKey: NavigatorKey.navigatorKey,
    );
    authStateListener.startListening();
  }

  @override
  void dispose() {
    authStateListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: NavigatorKey.navigatorKey,
      home: HomePage(),
    );
  }
}
