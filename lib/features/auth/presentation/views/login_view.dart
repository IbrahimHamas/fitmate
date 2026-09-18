import 'package:fitmate/core/common/utils/app_validator.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  void _submit() {
    final cubit = context.read<AuthCubit>();
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    cubit.signIn(email: _email.text, password: _password.text);
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is LoginLoading) {
        context.showLoadingDialog();
      } else if (state is LoginSuccess) {
        Navigator.of(context, rootNavigator: true).pop();
        context.showSuccessSnackBar(state.message);
        // Navigator.pushReplacementNamed(context, AppRoute.mainHome);
      } else if (state is LoginFailure) {
        Navigator.of(context, rootNavigator: true).pop();
        context.showErrorSnackBar(state.errorMessage);
      }
    },
    child: AuthScaffold(
      child: AutofillGroup(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthPageHeader(),
              const SizedBox(height: 36),
              AuthTextField(
                controller: _email,
                labelText: 'Email Address',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                validator: AppValidator.email,
                prefixIcon: const Icon(Icons.mail_outline),
              ),
              const SizedBox(height: 18),
              PasswordTextField(
                controller: _password,
                validator: AppValidator.loginPassword,
                showLockIcon: true,
                onFieldSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 12),
              AuthSubmitButton(
                label: 'Log In',
                onPressed: _submit,
                gradient: true,
              ),
              const SizedBox(height: 32),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(
                      context,
                    ).pushReplacementNamed(Routes.signUp),
                    child: const Text('Sign Up'),
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
