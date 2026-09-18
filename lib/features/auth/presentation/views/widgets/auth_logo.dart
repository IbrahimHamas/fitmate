import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key, this.uppercase = false});
  final bool uppercase;
  @override
  Widget build(BuildContext context) => Text(
    uppercase ? 'IRONPULSE' : 'IronPulse',
    style: Theme.of(
      context,
    ).textTheme.titleMedium?.copyWith(letterSpacing: uppercase ? 3 : 0),
  );
}
