import 'dart:async';

import 'package:fit_up/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthStateListener {
  StreamSubscription<AuthState>? _authSubscription;

  final GlobalKey<NavigatorState> navigatorKey;

  AuthStateListener({required this.navigatorKey});

  void startListening() {
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen(
      (data) {
        debugPrint('AUTH EVENT: ${data.event}');

        if (data.event == AuthChangeEvent.passwordRecovery) {
          debugPrint('================================');
          debugPrint('PASSWORD RECOVERY DETECTED');
          debugPrint('SESSION: ${data.session}');
          debugPrint('================================');

          WidgetsBinding.instance.addPostFrameCallback((_) {
            final navigator = navigatorKey.currentState;

            if (navigator == null) {
              debugPrint('Navigator is not ready');
              return;
            }

            navigator.pushReplacementNamed(Routes.resetPassword);
          });
        }
      },
      onError: (error) {
        debugPrint('Auth Error: $error');
      },
    );
  }

  Future<void> dispose() async {
    await _authSubscription?.cancel();
    _authSubscription = null;
  }
}
