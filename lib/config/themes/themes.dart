import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/current_local.dart';
import '../colors/app_colors.dart';

class Style {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kScaffoldLightColor,
    useMaterial3: false,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.kPrimaryColor,
          onPrimary: AppColors.kPrimaryColor,
          onSurface: AppColors.kPrimaryColor,
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kScaffoldLightColor,
      elevation: 0,
      titleTextStyle: GoogleFonts.elMessiri(
        color: AppColors.kPrimaryColor,
        fontSize: 16.sp,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.kScaffoldLightColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            ),
      bodyMedium: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            ),
      bodySmall: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            ),
      titleLarge: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            ),
      titleMedium: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            ),
      titleSmall: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kPrimaryColor,
            ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.kPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.kWhiteColor,
      selectedItemColor: AppColors.kPrimaryColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          isArabic()
              ? GoogleFonts.elMessiri(
                  color: AppColors.kPrimaryColor,
                )
              : GoogleFonts.elMessiri(
                  color: AppColors.kPrimaryColor,
                ),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      headerBackgroundColor: AppColors.kPrimaryColor,
      todayBackgroundColor: MaterialStateProperty.all(
        AppColors.kPrimaryColor,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.kPrimaryColor,
          onPrimary: AppColors.kPrimaryColor,
          onSurface: AppColors.kWhiteColor,
        ),
    useMaterial3: false,
    scaffoldBackgroundColor: (AppColors.kDarkPrimaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: (AppColors.kDarkPrimaryColor),
      elevation: 0,
      titleTextStyle: GoogleFonts.elMessiri(
        color: AppColors.kWhiteColor,
        fontSize: 18.sp,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.kWhiteColor,
    ),
    textTheme: TextTheme(
      bodyLarge: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            ),
      bodyMedium: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            ),
      bodySmall: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            ),
      titleLarge: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            ),
      titleMedium: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            ),
      titleSmall: isArabic()
          ? GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.elMessiri(
              color: AppColors.kWhiteColor,
            ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.kPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.kPrimaryColor,
      unselectedItemColor: AppColors.kWhiteColor,
      type: BottomNavigationBarType.fixed,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.kDarkThemColor,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.kWhiteColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          GoogleFonts.elMessiri(
            color: AppColors.kWhiteColor,
          ),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.kDarkPrimaryColor,
      headerHeadlineStyle: GoogleFonts.aBeeZee(color: Colors.white),
      headerHelpStyle: GoogleFonts.aBeeZee(color: Colors.white),
      dayStyle: GoogleFonts.aBeeZee(color: Colors.white),
      rangePickerHeaderHeadlineStyle: GoogleFonts.aBeeZee(color: Colors.white),
      rangePickerHeaderHelpStyle: GoogleFonts.aBeeZee(color: Colors.white),
      yearStyle: GoogleFonts.aBeeZee(color: Colors.white),
      weekdayStyle: GoogleFonts.aBeeZee(color: Colors.white),
      surfaceTintColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.aBeeZee(color: Colors.white),
        hintStyle: GoogleFonts.aBeeZee(color: Colors.white),
      ),
    ),
    timePickerTheme:
        const TimePickerThemeData(backgroundColor: AppColors.kDarkThemColor),
  );
}
