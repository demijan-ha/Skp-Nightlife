import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nightlife/const/const.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.BACKGROUND_COLOR,
      child: Center(
        child: SpinKitWave(
          color: AppColors.WHITE100_TEXT_COLOR,
          size: 50.0,
        ),
      ),
    );
  }
}
