import 'package:fitmate/features/auth/presentation/views/widgets/auth_back_button.dart';
import 'package:fitmate/features/auth/presentation/views/widgets/auth_logo.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.child,
    this.isSignUp = false,
    this.topSpacing = 32,
  });
  final Widget child;
  final bool isSignUp;
  final double topSpacing;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      toolbarHeight: 72,
      title: AuthLogo(uppercase: isSignUp),
      leading: AuthBackButton(
        color: isSignUp ? null : Theme.of(context).colorScheme.primary,
      ),
    ),
    body: SafeArea(
      top: false,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.fromLTRB(16, topSpacing, 16, 56),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: child,
          ),
        ),
      ),
    ),
  );
}
