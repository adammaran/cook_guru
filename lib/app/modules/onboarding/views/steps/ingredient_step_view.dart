import 'package:cook_guru/app/localization/app_strings.dart';
import 'package:cook_guru/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:cook_guru/app/widget/button/cta_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/theme/app_colors.dart';
import '../../../../constants/theme/app_styling.dart';
import '../../../../constants/theme/app_text_style.dart';
import '../../../../widget/check_mark/check_mark_widget.dart';
import '../../mock_data/data.dart';

class IngredientStepView extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.data.mockIngredients.length,
            itemBuilder: (_, index) => _buildIngredientTile(
                controller.data.mockIngredients.elementAt(index), index),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 12),
            // ),
          ),
        ),
        _buildRecipeCountButton()
      ],
    );
  }

  Widget _buildIngredientTile(IngredientMock ingredient, int index) => SizedBox(
      child: GestureDetector(
          onTap: () {
            controller.handleIngredientSelect(index);
          },
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
                      ])))));

  Widget _buildRecipeCountButton() => Container(
      alignment: Alignment.bottomRight,
      child: CTAButtonWidget(
        () => controller.recipesFound.value != -1
            ? controller.onNavigateForward()
            : null,
        body: Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  controller.recipesFound.value == -1
                      ? AppStrings.selectIngredients.tr
                      : controller.recipesFound.toString(),
                  style: TextStyle(color: AppColors.lightCream)),
              if (controller.recipesFound.value != -1) ...[
                const SizedBox(width: 8),
                Text(AppStrings.recipesFound.tr,
                    style: TextStyle(color: AppColors.lightCream))
              ]
            ],
          ),
        ),
      ));
}
