import 'package:cook_guru/app/constants/theme/app_colors.dart';
import 'package:cook_guru/app/constants/theme/app_styling.dart';
import 'package:cook_guru/app/constants/theme/app_text_style.dart';
import 'package:cook_guru/app/models/ingredient/ingredient_response.dart';
import 'package:cook_guru/app/tools/hex_color_translater.dart';
import 'package:cook_guru/app/widget/check_mark/check_mark_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IngredientTile extends StatelessWidget {
  Ingredient ingredient;
  Function()? onTap;

  IngredientTile({required this.ingredient, this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Material(
          color: AppColors.lightCream,
          borderRadius: AppStyling.borderRadius,
          elevation: AppStyling.elevation,
          child: Container(
            padding: AppStyling.innerTilePadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  const Icon(Icons.fastfood),
                  const SizedBox(width: 16),
                  Text(ingredient.name, style: AppTextStyle.cardTitle)
                ]),
                CheckMarkWidget(ingredient.isSelected)
              ],
            ),
          ),
        ),
      );
}
