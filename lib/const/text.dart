import 'package:flutter/material.dart';
import './const.dart';

class AppText {
  final String appTitle = 'Skopje Nightlife';
  final String homeScreenTopText = 'LOCAL EVENTS';
  final String homeScreenWelcomeText = 'What\'s up! ';
}

// TEXT STYLES //
const whiteTextStyle = TextStyle(
  color: AppColors.WHITE100_TEXT_COLOR,
);
const blackTextStyle = TextStyle(
  color: AppColors.BLACK_TEXT_COLOR,
);

final TextStyle fadedTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: AppColors.WHITE60_TEXT_COLOR,
);

final TextStyle whiteHeadingTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  color: AppColors.BACKGROUND_ACCENT_COLOR,
);

final TextStyle categoryTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: AppColors.WHITE87_TEXT_COLOR,
);

final TextStyle selectedCategoryTextStyle =
    categoryTextStyle.copyWith(color: AppColors.BACKGROUND_ACCENT_COLOR);

final TextStyle eventTitleTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: AppColors.WHITE100_TEXT_COLOR,
);

final TextStyle eventWhiteTitleTextStyle = TextStyle(
  fontSize: 38.0,
  fontWeight: FontWeight.bold,
  color: AppColors.WHITE100_TEXT_COLOR,
);

final TextStyle eventLocationTextStyle = TextStyle(
  fontSize: 16.0,
  color: AppColors.WHITE100_TEXT_COLOR,
);

final TextStyle guestTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w800,
  color: AppColors.WHITE100_TEXT_COLOR,
);

final TextStyle punchLine1TextStyle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.w800,
  color: AppColors.BACKGROUND_ACCENT_COLOR,
);

final TextStyle punchLine2TextStyle =
    punchLine1TextStyle.copyWith(color: AppColors.WHITE100_TEXT_COLOR);
