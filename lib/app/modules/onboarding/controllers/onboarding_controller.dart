import 'dart:math';

import 'package:cook_guru/app/localization/app_strings.dart';
import 'package:cook_guru/app/modules/onboarding/mock_data/data.dart';
import 'package:cook_guru/app/modules/onboarding/views/steps/ingredient_step_view.dart';
import 'package:cook_guru/app/modules/onboarding/views/steps/recipe_step_view.dart';
import 'package:cook_guru/app/modules/onboarding/views/steps/welcome_step_view.dart';
import 'package:cook_guru/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/recipes/recipes_response.dart';

class OnBoardingController extends GetxController {
  final ScrollController scrollController = ScrollController();

  final Data data = Data();

  ///Index type double because scroll animation position requirement
  RxDouble activeScreenIndex = RxDouble(0);
  RxBool isAnimationEnd = RxBool(false);

  RxInt selectedRecipeIndex = RxInt(-1);

  RxInt recipesFound = RxInt(-1);

  List<OnBoardingScreenWidget> onBoardingScreens = [
    OnBoardingScreenWidget(
        title: AppStrings.welcome.tr,
        description: AppStrings.welcomeScreenDesc.tr,
        body: WelcomeStepView(),
        pageIndex: 0),
    OnBoardingScreenWidget(
        title: AppStrings.ingredients.tr,
        description: AppStrings.ingredientsScreenDesc.tr,
        body: IngredientStepView(),
        pageIndex: 1),
    OnBoardingScreenWidget(
        title: AppStrings.recipes.tr,
        description: AppStrings.recipesScreenDesc.tr,
        body: RecipeStepView(),
        pageIndex: 2),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onNavigateBack() {
    if (activeScreenIndex.value > 0) {
      animateToScreen(false);
    }
  }

  void onNavigateForward() {
    if (activeScreenIndex.value < onBoardingScreens.length - 1) {
      animateToScreen(true);
    } else {
      Get.offAllNamed(AppPages.ingredientSelect);
    }
  }

  Future<void> animateToScreen(bool isForward) async {
    scrollController.animateTo(
        Get.width *
            (isForward ? ++activeScreenIndex.value : --activeScreenIndex.value),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn);
  }

  void openMockRecipe(int index) {
    selectedRecipeIndex.value = index;
  }

  void handleIngredientSelect(int index) {
    data.mockIngredients.elementAt(index).isSelected.toggle();

    for (bool isSelected
        in data.mockIngredients.map((e) => e.isSelected.value).toList()) {
      if (isSelected) {
        recipesFound.value = Random().nextInt(10);
        break;
      } else {
        recipesFound.value = -1;
      }
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class OnBoardingScreenWidget {
  String title;
  String description;
  Widget body;
  int pageIndex;

  OnBoardingScreenWidget(
      {required this.title,
      required this.description,
      required this.body,
      required this.pageIndex});
}
