import 'package:flutter/material.dart';
import 'package:nightlife/const/const.dart';
import 'package:nightlife/models/categories.dart';
import 'package:nightlife/screens/app_state.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  CategoryWidget({@required this.category});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected
                  ? AppColors.BACKGROUND_ACCENT_COLOR
                  : AppColors.WHITE87_TEXT_COLOR),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: isSelected
              ? AppColors.BACKGROUND_COLOR
              : AppColors.BACKGROUND_TOP_COLOR,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              category.icon,
              color: isSelected
                  ? AppColors.BACKGROUND_ACCENT_COLOR
                  : AppColors.WHITE87_TEXT_COLOR,
              size: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              category.name,
              style: isSelected ? selectedCategoryTextStyle : categoryTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
