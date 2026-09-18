import 'package:fitmate/core/themes/app_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class AppTheme {
  // Lexend is a visual approximation; the PNGs do not identify the font.
  static const String fontFamily = 'Lexend';
  static const double fieldRadius = 12;
  static const double buttonRadius = 12;
  static const double cardRadius = 16;
  static const double buttonHeight = 56;

  // Use these decorations for the gradient/glow button variant in auth.
  static const LinearGradient primaryButtonGradient = LinearGradient(
    colors: [AppColor.primary, AppColor.primaryDark],
  );
  static const List<BoxShadow> primaryButtonShadows = [
    BoxShadow(
      color: AppColor.primaryGlow,
      blurRadius: 16,
      offset: Offset(0, 6),
    ),
  ];

  static const SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: AppColor.background,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: AppColor.divider,
  );

  static ThemeData get darkTheme {
    const colorScheme = ColorScheme.dark(
      primary: AppColor.primary,
      onPrimary: AppColor.onPrimary,
      primaryContainer: AppColor.primaryContainer,
      onPrimaryContainer: AppColor.textPrimary,
      secondary: AppColor.secondary,
      onSecondary: AppColor.textPrimary,
      secondaryContainer: AppColor.surfaceElevated,
      onSecondaryContainer: AppColor.textPrimary,
      tertiary: AppColor.success,
      onTertiary: AppColor.background,
      surface: AppColor.surface,
      onSurface: AppColor.textPrimary,
      onSurfaceVariant: AppColor.textSecondary,
      surfaceDim: AppColor.background,
      surfaceBright: AppColor.surfaceElevated,
      surfaceContainerLowest: AppColor.surfaceDeep,
      surfaceContainerLow: AppColor.surfaceSoft,
      surfaceContainer: AppColor.surface,
      surfaceContainerHigh: AppColor.surfaceElevated,
      surfaceContainerHighest: AppColor.secondary,
      outline: AppColor.inputBorder,
      outlineVariant: AppColor.outlineSoft,
      error: AppColor.danger,
      onError: AppColor.onPrimary,
      errorContainer: AppColor.dangerContainer,
      onErrorContainer: AppColor.textPrimary,
      inverseSurface: AppColor.textPrimary,
      onInverseSurface: AppColor.background,
      inversePrimary: AppColor.primaryDark,
      shadow: AppColor.cardShadow,
      scrim: AppColor.scrim,
      surfaceTint: Colors.transparent,
    );
    final textTheme = _textTheme;
    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonRadius),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColor.background,
      canvasColor: AppColor.background,
      disabledColor: AppColor.textDisabled,
      dividerColor: AppColor.divider,
      textTheme: textTheme,
      iconTheme: const IconThemeData(color: AppColor.textSecondary, size: 24),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 64,
        titleTextStyle: textTheme.titleMedium,
        iconTheme: const IconThemeData(color: AppColor.textPrimary, size: 24),
        systemOverlayStyle: systemOverlayStyle,
      ),
      cardTheme: CardThemeData(
        color: AppColor.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shadowColor: AppColor.cardShadow,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardRadius),
          side: const BorderSide(color: AppColor.outlineSoft),
        ),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: AppColor.inputField,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        labelStyle: textTheme.labelMedium,
        floatingLabelStyle: textTheme.labelMedium,
        hintStyle: textTheme.bodyLarge?.copyWith(color: AppColor.hint),
        errorStyle: textTheme.bodySmall?.copyWith(color: AppColor.danger),
        errorMaxLines: 2,
        prefixIconColor: AppColor.textSecondary,
        suffixIconColor: AppColor.textSecondary,
        border: _inputBorder(AppColor.inputBorder),
        enabledBorder: _inputBorder(AppColor.inputBorder),
        focusedBorder: _inputBorder(AppColor.primary, width: 1.5),
        disabledBorder: _inputBorder(AppColor.outlineSoft),
        errorBorder: _inputBorder(AppColor.danger),
        focusedErrorBorder: _inputBorder(AppColor.danger, width: 1.5),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColor.primary,
        selectionColor: AppColor.primaryGlow,
        selectionHandleColor: AppColor.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(64, buttonHeight),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          foregroundColor: AppColor.onPrimary,
          backgroundColor: AppColor.primary,
          disabledForegroundColor: AppColor.textDisabled,
          disabledBackgroundColor: AppColor.surfaceElevated,
          surfaceTintColor: Colors.transparent,
          elevation: 4,
          shadowColor: AppColor.primaryGlow,
          shape: buttonShape,
          textStyle: textTheme.labelLarge,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(64, buttonHeight),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          foregroundColor: AppColor.onPrimary,
          backgroundColor: AppColor.primary,
          disabledForegroundColor: AppColor.textDisabled,
          disabledBackgroundColor: AppColor.surfaceElevated,
          shape: buttonShape,
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          foregroundColor: AppColor.textPrimary,
          backgroundColor: AppColor.surface,
          disabledForegroundColor: AppColor.textDisabled,
          side: const BorderSide(color: AppColor.inputBorder),
          shape: buttonShape,
          textStyle: textTheme.labelMedium,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.primary,
          disabledForegroundColor: AppColor.textDisabled,
          textStyle: textTheme.labelMedium,
        ),
      ),
      searchBarTheme: SearchBarThemeData(
        backgroundColor: const WidgetStatePropertyAll(AppColor.surface),
        surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
        elevation: const WidgetStatePropertyAll(0),
        constraints: const BoxConstraints(minHeight: 48),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(fieldRadius),
          ),
        ),
        textStyle: WidgetStatePropertyAll(textTheme.bodyLarge),
        hintStyle: WidgetStatePropertyAll(
          textTheme.bodyLarge?.copyWith(color: AppColor.hint),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 64,
        backgroundColor: AppColor.background,
        surfaceTintColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? AppColor.primary
                : AppColor.textSecondary,
            size: 24,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return _textStyle(
            10,
            FontWeight.w500,
            color: states.contains(WidgetState.selected)
                ? AppColor.primary
                : AppColor.textSecondary,
          );
        }),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.background,
        elevation: 0,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.textSecondary,
        selectedIconTheme: const IconThemeData(size: 24),
        unselectedIconTheme: const IconThemeData(size: 24),
        selectedLabelStyle: _textStyle(10, FontWeight.w500),
        unselectedLabelStyle: _textStyle(10, FontWeight.w500),
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColor.surfaceElevated,
        selectedColor: AppColor.primaryContainer,
        disabledColor: AppColor.surfaceSoft,
        labelStyle: textTheme.labelSmall,
        secondaryLabelStyle: textTheme.labelSmall?.copyWith(
          color: AppColor.primary,
        ),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: AppColor.textSecondary,
        textColor: AppColor.textPrimary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        titleTextStyle: textTheme.bodyLarge,
        subtitleTextStyle: textTheme.bodyMedium?.copyWith(
          color: AppColor.textSecondary,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColor.divider,
        thickness: 1,
        space: 1,
      ),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColor.surfaceElevated;
          }
          return states.contains(WidgetState.selected)
              ? AppColor.primary
              : AppColor.controlInactive;
        }),
        thumbColor: const WidgetStatePropertyAll(AppColor.textPrimary),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
      checkboxTheme: CheckboxThemeData(
        side: const BorderSide(color: AppColor.inputBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColor.surfaceElevated;
          }
          return states.contains(WidgetState.selected)
              ? AppColor.primary
              : Colors.transparent;
        }),
        checkColor: const WidgetStatePropertyAll(AppColor.onPrimary),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.primary,
        linearTrackColor: AppColor.surfaceElevated,
        circularTrackColor: AppColor.surfaceElevated,
        linearMinHeight: 4,
        borderRadius: BorderRadius.all(Radius.circular(999)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColor.surface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardRadius),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColor.surface,
        modalBackgroundColor: AppColor.surface,
        surfaceTintColor: Colors.transparent,
        dragHandleColor: AppColor.inputBorder,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColor.surfaceElevated,
        behavior: SnackBarBehavior.floating,
        actionTextColor: AppColor.primary,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: AppColor.textPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(fieldRadius),
        ),
      ),
    );
  }

  static TextTheme get _textTheme => TextTheme(
    displayLarge: _textStyle(48, FontWeight.w900, height: 1.15),
    displayMedium: _textStyle(36, FontWeight.w800, height: 1.2),
    displaySmall: _textStyle(32, FontWeight.w700, height: 1.25),
    headlineLarge: _textStyle(32, FontWeight.w700, height: 1.25),
    headlineMedium: _textStyle(28, FontWeight.w700, height: 1.3),
    headlineSmall: _textStyle(24, FontWeight.w700, height: 1.3),
    titleLarge: _textStyle(20, FontWeight.w700, height: 1.4),
    titleMedium: _textStyle(18, FontWeight.w700, height: 1.4),
    titleSmall: _textStyle(16, FontWeight.w600, height: 1.5),
    bodyLarge: _textStyle(16, FontWeight.w400, height: 1.5),
    bodyMedium: _textStyle(
      14,
      FontWeight.w400,
      color: AppColor.textBody,
      height: 1.5,
    ),
    bodySmall: _textStyle(
      12,
      FontWeight.w400,
      color: AppColor.textSecondary,
      height: 1.5,
    ),
    labelLarge: _textStyle(16, FontWeight.w700, height: 1.5),
    labelMedium: _textStyle(14, FontWeight.w500, height: 1.4),
    labelSmall: _textStyle(10, FontWeight.w700, height: 1.4, letterSpacing: 1),
  );

  static TextStyle _textStyle(
    double size,
    FontWeight weight, {
    Color color = AppColor.textPrimary,
    double height = 1.4,
    double letterSpacing = 0,
  }) => TextStyle(
    fontFamily: fontFamily,
    fontSize: size,
    fontWeight: weight,
    fontVariations: [FontVariation('wght', weight.value.toDouble())],
    color: color,
    height: height,
    letterSpacing: letterSpacing,
  );

  static OutlineInputBorder _inputBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(fieldRadius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
