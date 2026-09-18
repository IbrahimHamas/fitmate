import 'package:fitmate/core/routing/routes.dart';
import 'package:flutter/material.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({super.key, this.onPressed, this.color});
  final VoidCallback? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: 'Back',
    color: color,
    icon: const Icon(Icons.arrow_back),
    onPressed:
        onPressed ??
        () {
          final navigator = Navigator.of(context);
          if (navigator.canPop()) {
            navigator.pop();
          } else {
            navigator.pushReplacementNamed(Routes.welcome);
          }
        },
  );
}
