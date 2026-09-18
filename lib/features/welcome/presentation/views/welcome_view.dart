import 'package:fitmate/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key, this.onGetStarted, this.onClose});

  final VoidCallback? onGetStarted;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemOverlayStyle,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 72,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            onPressed: onClose,
            tooltip: 'Close',
            disabledColor: theme.colorScheme.onSurface,
            icon: const Icon(Icons.close, size: 24),
          ),
          title: const Text('IronPulse'),
        ),
        body: SafeArea(
          top: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final landscape =
                  constraints.maxWidth > constraints.maxHeight &&
                  constraints.maxHeight < 600;
              final photo = Image.asset(
                'assets/images/welcome/runner.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.center,
                excludeFromSemantics: true,
                errorBuilder: (_, _, _) =>
                    ColoredBox(color: theme.colorScheme.surface),
              );
              final content = _WelcomeContent(onGetStarted: onGetStarted);
              if (landscape) {
                return Row(
                  children: [
                    Expanded(child: SizedBox.expand(child: photo)),
                    Expanded(child: content),
                  ],
                );
              }
              final photoHeight = (constraints.maxHeight - 400).clamp(
                constraints.maxHeight * 0.28,
                constraints.maxHeight * 0.54,
              );
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: photoHeight,
                    child: photo,
                  ),
                  Expanded(child: content),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _WelcomeContent extends StatelessWidget {
  const _WelcomeContent({this.onGetStarted});
  final VoidCallback? onGetStarted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                24,
                (constraints.maxHeight * 0.14).clamp(24, 64),
                24,
                46,
              ),
              child: Column(
                children: [
                  Text(
                    'Welcome to\nIronPulse',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Fuel your progress. Your journey to elite performance starts here.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      height: 1.6,
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppTheme.buttonRadius,
                      ),
                      boxShadow: AppTheme.primaryButtonShadows,
                    ),
                    child: FilledButton(
                      onPressed: onGetStarted,
                      style: FilledButton.styleFrom(
                        // Retain the approved visual while callbacks are pending.
                        disabledBackgroundColor: colors.primary,
                        disabledForegroundColor: colors.onPrimary,
                      ),
                      child: const Text('Get Started'),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Spacer(),
                  // Devices with gesture insets supply their own home indicator.
                  if (MediaQuery.viewPaddingOf(context).bottom == 0)
                    ExcludeSemantics(
                      child: Container(
                        width: 128,
                        height: 4,
                        decoration: BoxDecoration(
                          color: colors.secondary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
