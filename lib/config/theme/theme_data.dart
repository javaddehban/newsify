import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/config/resource/my_colors.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    required Color secondaryText,
    required Color accentColor,
    required Color divider,
    required Color buttonBackground,
    required Color buttonText,
    required Color cardBackground,
    required Color disabled,
    required Color error,
    required Color textButtonColor,
    required Color hintColor,
    required Color textFieldColor,
    required Color checkBoxColor,
    required Color iconColor,
  }) {
    final baseTextTheme = brightness == Brightness.light
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      canvasColor: background,
      cardColor: background,
      dividerColor: divider,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: MyColors.primary,
      ),
      primaryColor: accentColor,
      appBarTheme: AppBarTheme(
        color: cardBackground,
        iconTheme: IconThemeData(
          color: iconColor,
        ),
      ),
      iconTheme: IconThemeData(
        color: secondaryText,
        size: 20.0,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: buttonBackground,
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: accentColor,
          // primaryVariant: accentColor,
          secondary: accentColor,
          // secondaryVariant: accentColor,
          surface: background,
          background: background,
          error: error,
          onPrimary: buttonText,
          onSecondary: buttonText,
          onSurface: buttonText,
          onBackground: buttonText,
          onError: buttonText,
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            // primary: textButtonColor,
            textStyle: baseTextTheme.headlineSmall!.copyWith(
          color: primaryText,
          fontFamily: GoogleFonts.tinos().fontFamily,
        )),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: GoogleFonts.montserrat(color: error),
        labelStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          color: primaryText.withOpacity(0.5),
        ),
        hintStyle: GoogleFonts.montserrat(
          color: hintColor,
          fontSize: 13.0,
          fontWeight: FontWeight.w300,
        ),
        contentPadding: const EdgeInsets.all(0),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
      ),
      fontFamily: GoogleFonts.tinos().fontFamily,
      textTheme: TextTheme(
        bodyLarge: baseTextTheme.bodyLarge!.copyWith(
          color: secondaryText,
          fontFamily: GoogleFonts.tinos().fontFamily,
        ),
        bodyMedium: baseTextTheme.bodyMedium!.copyWith(
          color: secondaryText,
          fontFamily: GoogleFonts.tinos().fontFamily,
        ),
        bodySmall: baseTextTheme.bodySmall!.copyWith(
          color: secondaryText,
          fontFamily: GoogleFonts.tinos().fontFamily,
        ),
        displaySmall: baseTextTheme.displaySmall!.copyWith(
          color: secondaryText,
          fontFamily: GoogleFonts.tinos().fontFamily,
        ),
        displayLarge: baseTextTheme.displayLarge!.copyWith(
          color: secondaryText,
          fontFamily: GoogleFonts.tinos().fontFamily,
        ),
        displayMedium: baseTextTheme.displayMedium!.copyWith(
          color: secondaryText,
          fontFamily: GoogleFonts.tinos().fontFamily,
        ),
        headlineSmall: baseTextTheme.headlineSmall!.copyWith(
          color: secondaryText,
          fontFamily: GoogleFonts.tinos().fontFamily,
        ),
        headlineMedium: baseTextTheme.headlineMedium!.copyWith(
          color: secondaryText,
          fontFamily: GoogleFonts.tinos().fontFamily,
        ),
        headlineLarge: baseTextTheme.headlineLarge!.copyWith(
          color: secondaryText,
          fontFamily: GoogleFonts.tinos().fontFamily,
        ),
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
      brightness: Brightness.light,
      background: MyColors.white,
      cardBackground: MyColors.white,
      primaryText: MyColors.primary,
      secondaryText: MyColors.grey.shade800,
      accentColor: MyColors.primary,
      divider: MyColors.primary.shade100,
      buttonBackground: MyColors.primary,
      buttonText: MyColors.white,
      disabled: MyColors.white,
      error: MyColors.danger,
      textButtonColor: MyColors.grey.shade900,
      hintColor: MyColors.white,
      textFieldColor: MyColors.white,
      checkBoxColor: MyColors.primary,
      iconColor: MyColors.grey.shade900);

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        background: MyColors.grey,
        cardBackground: MyColors.grey.shade800,
        primaryText: MyColors.white,
        secondaryText: MyColors.white,
        accentColor: MyColors.primary,
        divider: MyColors.white.withOpacity(0.2),
        buttonBackground: MyColors.primary,
        buttonText: MyColors.white,
        disabled: MyColors.white.withOpacity(0.5),
        error: MyColors.danger,
        textButtonColor: MyColors.white,
        hintColor: MyColors.white.withOpacity(0.5),
        textFieldColor: MyColors.white,
        checkBoxColor: MyColors.primary,
        iconColor: MyColors.white,
      );
}
