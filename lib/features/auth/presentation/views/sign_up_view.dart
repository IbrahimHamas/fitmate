import 'package:fitmate/core/constants/app_strings.dart';
import 'package:fitmate/core/common/utils/app_validator.dart';
import 'package:fitmate/core/extensions/snack_bar_context_extension.dart';
import 'package:fitmate/core/routing/routes.dart';
import 'package:fitmate/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:fitmate/features/auth/presentation/view_model/auth_state.dart';
import 'package:fitmate/features/auth/presentation/views/widgets/auth_page_header.dart';
import 'package:fitmate/features/auth/presentation/views/widgets/auth_scaffold.dart';
import 'package:fitmate/features/auth/presentation/views/widgets/auth_submit_button.dart';
import 'package:flutter/material.dart';
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
  final _obscurePassword = ValueNotifier<bool>(true);
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
    _obscurePassword.dispose();
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
              Text(
                AppStrings.fullName,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _name,
                textCapitalization: TextCapitalization.words,
                autofillHints: const [AutofillHints.name],
                validator: AppValidator.fullName,
                decoration: const InputDecoration(
                  hintText: AppStrings.enterYourName,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                AppStrings.emailAddress,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                validator: AppValidator.email,
                decoration: const InputDecoration(
                  hintText: AppStrings.enterYourEmail,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                AppStrings.password,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              ValueListenableBuilder<bool>(
                valueListenable: _obscurePassword,
                builder: (context, obscurePassword, child) => TextFormField(
                  controller: _password,
                  obscureText: obscurePassword,
                  validator: AppValidator.password,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.newPassword],
                  autocorrect: false,
                  enableSuggestions: false,
                  onFieldSubmitted: (_) => _submit(),
                  decoration: InputDecoration(
                    hintText: AppStrings.createAPassword,
                    suffixIcon: IconButton(
                      onPressed: () =>
                          _obscurePassword.value = !obscurePassword,
                      tooltip: obscurePassword
                          ? AppStrings.showPassword
                          : AppStrings.hidePassword,
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AuthSubmitButton(
                label: AppStrings.createAccount,
                onPressed: _submit,
              ),
              const SizedBox(height: 28),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAnAccount,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(
                      context,
                    ).pushReplacementNamed(Routes.login),
                    child: const Text(AppStrings.logInLink),
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
