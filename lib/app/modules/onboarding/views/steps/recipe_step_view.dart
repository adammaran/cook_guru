import 'package:cook_guru/app/constants/theme/app_colors.dart';
import 'package:cook_guru/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:cook_guru/app/modules/recipe_details/controllers/recipe_details_controller.dart';
import 'package:cook_guru/app/modules/recipe_details/views/recipe_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/theme/app_styling.dart';
import '../../../../constants/theme/app_text_style.dart';
import '../../../../models/recipes/recipes_response.dart';
import '../../../../widget/image/network_image_widget.dart';
import '../../../../widget/recipe/recipe_tile.dart';

class RecipeStepView extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return _buildRecipeList();
  }

  Widget _buildRecipeList() =>
      Obx(() => controller.selectedRecipeIndex.value != -1
          ? _buildRecipeDetails(controller.data.mockRecipes
              .elementAt(controller.selectedRecipeIndex.value))
          : ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) => RecipeTile(
                controller.data.mockRecipes.elementAt(index),
                hasElevation: false,
                onMoreTap: () {
                  controller.openMockRecipe(index);
                },
              ),
              separatorBuilder: (_, index) => const SizedBox(height: 8),
              itemCount: controller.data.mockRecipes.length,
            ));

  Widget _buildRecipeDetails(Recipe recipe) {
    return Hero(
        tag: recipe.id,
        child: Material(
          borderRadius: AppStyling.borderRadius,
          color: AppColors.lightCream,
          child: Column(
            children: [
              _buildPageHeader(recipe),
              Expanded(child: _buildPageBody(recipe))
            ],
          ),
        ));
  }

  Stack _buildPageHeader(Recipe recipe) => Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipRRect(
              borderRadius: AppStyling.topBorderRadius,
              child: Image.asset(
                recipe.headerImageUrl ?? '',
              )),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      controller.selectedRecipeIndex.value = -1;
                    },
                    child: Icon(Icons.arrow_back_outlined,
                        color: AppColors.lightCream)),
                const SizedBox(width: 12),
                Text(
                  recipe.name,
                  style: AppTextStyle.cardTitle
                      .copyWith(color: AppColors.lightCream),
                )
              ],
            ),
          ),
        ],
      );

  Container _buildPageBody(Recipe recipe) => Container(
        color: AppColors.lightCream,
        margin: AppStyling.pagePadding,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(recipe.name, style: AppTextStyle.cardTitle),
                Text(recipe.duration)
              ],
            ),
            const SizedBox(height: 12),
            Text(recipe.description, style: AppTextStyle.description)
          ],
        ),
      );
}
