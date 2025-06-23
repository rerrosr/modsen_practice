import 'package:flutter/material.dart';

import 'crypto_coin_colors.dart';
import 'crypto_coin_dimens.dart';
import 'crypto_coin_fonts.dart';

abstract class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: CryptoCoinColors.blackBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: CryptoCoinColors.blackBackgroundColor,
        primary: CryptoCoinColors.blackBackgroundColor,
        secondary: CryptoCoinColors.whiteSecondaryColor,
        brightness: Brightness.dark,
      ),
      textTheme: const TextTheme(
        displayLarge: CryptoCoinFonts.titleText,
        bodyLarge: CryptoCoinFonts.descriptionText,
        labelLarge: CryptoCoinFonts.buttonText,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: CryptoCoinColors.blueButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              CryptoCoinDimens.BORDER_RADIUS_25,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              CryptoCoinDimens.BORDER_RADIUS_25,
            ),
          ),
        ),
      ),
    );
  }
}
