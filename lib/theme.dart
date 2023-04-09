import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme() {
  const colorScheme = ColorScheme(
      inversePrimary: Color(0xFF1E1E1E),
      outline: Color(0xFFFFFFFF),
      brightness: Brightness.light,
      primary: Color(0xFF36CE7F),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF34C288),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFEE6868),
      onError: Color(0xFFFFFFFF),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF37D288),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFFA5A5A5),
      tertiary: Color(0xFF31A89E),
      onPrimaryContainer: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFF2F2F2),
      secondaryContainer: Color(0xFF1E1E1E));

  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: colorScheme.background,
    colorScheme: colorScheme,
    splashFactory: InkSplash.splashFactory,
    shadowColor: const Color(0xFF434E61),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color(0xFF000000),
      selectionColor: const Color(0xFF434E61).withOpacity(0.5),
      selectionHandleColor: const Color(0xFF434E61).withOpacity(0.5),
    ),
    unselectedWidgetColor: colorScheme.onSurface,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.onSurface.withOpacity(0.1),
      contentPadding: EdgeInsets.all(20.h),
      isDense: false,
      suffixIconColor: const Color(0xFFA5A5A5),
      prefixIconColor: const Color(0xFFA5A5A5),
      prefixStyle: TextStyle(
        color: colorScheme.inversePrimary,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16.sp,
      ),
      hintStyle: TextStyle(
        color: const Color(0xFFA5A5A5),
        fontSize: 16.sp,
      ),
      labelStyle: TextStyle(
        color: const Color(0xFFA5A5A5),
        fontSize: 16.sp,
      ),
      disabledBorder: InputBorder.none,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: colorScheme.onBackground)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: BorderSide(
          color: colorScheme.error,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: BorderSide(
          color: colorScheme.error,
        ),
      ),
      errorMaxLines: 3,
      errorStyle: const TextStyle(height: 0),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        minimumSize: Size(335.w, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 0,
        foregroundColor: colorScheme.onPrimary,
        disabledBackgroundColor: const Color(0xFFA5A5A5),
        disabledForegroundColor: colorScheme.onPrimary,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: colorScheme.background,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        color: colorScheme.inversePrimary,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.r),
    )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      enableFeedback: true,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFFFFFFFF),
      selectedItemColor: colorScheme.onBackground,
      unselectedItemColor: const Color(0xFFA5A5A5),
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: colorScheme.onBackground,
        fontSize: 9.sp,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: const Color(0xFFA5A5A5),
        fontSize: 9.sp,
      ),
      selectedIconTheme: IconThemeData(
        color: colorScheme.onBackground,
        size: 24.r,
      ),
      unselectedIconTheme: IconThemeData(
        color: const Color(0xFFA5A5A5),
        size: 24.r,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: Color(0xFF434E61),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFA5A5A5)),
    primaryIconTheme: const IconThemeData(color: Color(0xFFA5A5A5)),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: colorScheme.inversePrimary,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16.sp,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: colorScheme.onSurface,
        fontSize: 12.sp,
      ),
      labelLarge: TextStyle(
        color: colorScheme.onSecondary,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 16.sp,
      ),
      displayLarge: TextStyle(
        color: const Color(0xFF1E1E1E),
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 32.sp,
      ),
      displayMedium: TextStyle(
        color: const Color(0xFF1E1E1E),
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 28.sp,
      ),
      displaySmall: TextStyle(
        color: const Color(0xFF1E1E1E),
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 24.sp,
      ),
      headlineMedium: TextStyle(
        color: const Color(0xFF1E1E1E),
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 20.sp,
      ),
      headlineSmall: TextStyle(
        color: const Color(0xFF707070),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16.sp,
        height: 1.5,
      ),
      titleLarge: TextStyle(
        color: const Color(0xFF707070),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}
