import 'package:fitmate/core/common/utils/app_validator.dart';
import 'package:fitmate/core/extensions/screen_context_extension.dart';
import 'package:fitmate/core/extensions/snack_bar_context_extension.dart';
import 'package:fitmate/core/routing/routes.dart';
import 'package:fitmate/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:fitmate/features/auth/presentation/view_model/auth_state.dart';
import 'package:fitmate/features/auth/presentation/views/widgets/auth_page_header.dart';
import 'package:fitmate/features/auth/presentation/views/widgets/auth_scaffold.dart';
import 'package:fitmate/features/auth/presentation/views/widgets/auth_submit_button.dart';
import 'package:fitmate/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:fitmate/features/auth/presentation/views/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  void _submit() {
    final cubit = context.read<AuthCubit>();
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    cubit.signUp(
      fullName: _name.text,
      email: _email.text,
      password: _password.text,
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is SignUpLoading) {
        context.showLoadingDialog();
      } else if (state is SignUpSuccess) {
        Navigator.of(context, rootNavigator: true).pop();
        context.showSuccessSnackBar(state.message);
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(Routes.login, (route) => false);
      } else if (state is SignUpFailure) {
        Navigator.of(context, rootNavigator: true).pop();
        context.showErrorSnackBar(state.errorMessage);
      }
    },
    child: AuthScaffold(
      isSignUp: true,
      topSpacing: 0,
      child: AutofillGroup(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthPageHeader(isSignUp: true),
              const SizedBox(height: 48),
              AuthTextField(
                controller: _name,
                labelText: 'Full Name',
                hintText: 'Enter your name',
                textCapitalization: TextCapitalization.words,
                autofillHints: const [AutofillHints.name],
                validator: AppValidator.fullName,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
              const SizedBox(height: 18),
              AuthTextField(
                controller: _email,
                labelText: 'Email Address',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                validator: AppValidator.email,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
              const SizedBox(height: 18),
              PasswordTextField(
                controller: _password,
                hintText: 'Create a password',
                validator: AppValidator.password,
                isNewPassword: true,
                fillColor: context.theme.colorScheme.surface,
                onFieldSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 24),
              AuthSubmitButton(label: 'Create Account', onPressed: _submit),
              const SizedBox(height: 28),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(
                      context,
                    ).pushReplacementNamed(Routes.login),
                    child: const Text('Log in'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
