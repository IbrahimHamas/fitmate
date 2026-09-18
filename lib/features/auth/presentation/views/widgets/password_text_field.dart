import 'package:fitmate/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.labelText = 'Password',
    this.hintText = 'Enter your password',
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onFieldSubmitted,
    this.enabled = true,
    this.isNewPassword = false,
    this.showLockIcon = false,
    this.fillColor,
  });
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool enabled;
  final bool isNewPassword;
  final bool showLockIcon;
  final Color? fillColor;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) => AuthTextField(
    controller: widget.controller,
    labelText: widget.labelText,
    hintText: widget.hintText,
    obscureText: _obscure,
    textInputAction: widget.textInputAction,
    validator: widget.validator,
    enabled: widget.enabled,
    fillColor: widget.fillColor,
    keyboardType: TextInputType.visiblePassword,
    autofillHints: [
      widget.isNewPassword ? AutofillHints.newPassword : AutofillHints.password,
    ],
    onFieldSubmitted: widget.onFieldSubmitted,
    prefixIcon: widget.showLockIcon ? const Icon(Icons.lock_outline) : null,
    suffixIcon: IconButton(
      onPressed: widget.enabled
          ? () => setState(() => _obscure = !_obscure)
          : null,
      tooltip: _obscure ? 'Show password' : 'Hide password',
      icon: Icon(
        _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
      ),
    ),
  );
}
