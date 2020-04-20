import 'package:flutter/material.dart';

const String appTitle = 'Skopje Nightlife';

class AppColors {
  static const Color PRIMARY_APPBAR_COLOR = Colors.black87;
  static const Color PRIMARY_COLOR = Colors.black87;
  static const Color SECONDARY_COLOR = Colors.deepOrange;
  static const Color BACKGROUND_COLOR = Colors.white70;
  static const Color BACKGROUND_COLOR_BLACK = Colors.black87;
  static const Color MAIN_TEXT_COLOR = Colors.black87;
  static const Color ACCENT_TEXT_COLOR = Colors.deepOrange;
  static const Color WHITE_TEXT_COLOR = Colors.white;
  static const Color ACCENT_COLOR = Colors.deepOrange;
}

const textStyleWhite = TextStyle(
  color: AppColors.WHITE_TEXT_COLOR,
);

const textStyleAccent = TextStyle(
  color: AppColors.ACCENT_TEXT_COLOR,
  fontSize: 36.0,
);
const headerStyleAccent = TextStyle(
  color: AppColors.ACCENT_TEXT_COLOR,
  fontSize: 72.0,
  fontWeight: FontWeight.bold,
);

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.deepOrange,
      width: 2.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
);
