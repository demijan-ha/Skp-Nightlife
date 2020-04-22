import 'package:flutter/material.dart';
import './const.dart';

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
