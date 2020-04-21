import 'package:flutter/material.dart';

const String appTitle = 'Skopje Nightlife';

class AppColors {
  static const Color PRIMARY_ACCENT_COLOR = Color(0xFFf4511e);
  static const Color SECONDARY_ACCENT_COLOR = Color(0xFFffab91);

  static const Color BACKGROUND_COLOR = Color(0x1184C9FB);
  static const Color PRIMARY_APPBAR_COLOR = Color(0xFF272727);

  static const Color LIGHT_GREY = Color(0xFF484848);
  static const Color BLACK = Colors.black;
  static const Color WHITE = Colors.white;

  static const Color ERROR = Color(0xFF900000);
  static const Color SUCCESS = Color(0xFF1b5e20);

  static const Color ACCENT_TEXT_COLOR_PRIMARY = Color(0xFFf4511e);
  static const Color ACCENT_TEXT_COLOR_SECONDARY = Color(0xFFffab91);

  static const Color WHITE100_TEXT_COLOR = Colors.white;
  static const Color WHITE87_TEXT_COLOR = Color(0x87ffffff);
  static const Color WHITE60_TEXT_COLOR = Colors.white60;
  static const Color DISABLED_TEXT_COLOR = Colors.white38;
  static const Color BLACK_TEXT_COLOR = Colors.black;
}

const whiteTextStyle = TextStyle(
  color: AppColors.WHITE100_TEXT_COLOR,
);
const blackTextStyle = TextStyle(
  color: AppColors.BLACK_TEXT_COLOR,
);
const textStyleAccent = TextStyle(
  color: AppColors.ACCENT_TEXT_COLOR_PRIMARY,
  fontSize: 36.0,
);
const headerStyleAccent = TextStyle(
  color: AppColors.ACCENT_TEXT_COLOR_PRIMARY,
  fontSize: 72.0,
  fontWeight: FontWeight.bold,
);

InputDecoration inputDecoration = InputDecoration(
  hasFloatingPlaceholder: true,
  labelStyle: TextStyle(color: AppColors.WHITE60_TEXT_COLOR, fontSize: 16.0),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.WHITE87_TEXT_COLOR),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.WHITE),
  ),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.ERROR),
  ),
);

DecorationImage backgroundImage = DecorationImage(
  image: ExactAssetImage('assets/img/login.jpg'),
  fit: BoxFit.cover,
);

DecorationImage diamond = DecorationImage(
  image: ExactAssetImage('assets/img/diamond.png'),
  fit: BoxFit.cover,
);
