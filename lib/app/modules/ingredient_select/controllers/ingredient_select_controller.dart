import 'dart:async';
import 'dart:convert';

import 'package:cook_guru/app/models/ingredient/ingredient_response.dart';
import 'package:cook_guru/app/models/recipes/recipes_response.dart';
import 'package:cook_guru/app/service/ingredient/ingredients_service.dart';
import 'package:cook_guru/app/service/recipe/recipes_service.dart';
import 'package:cook_guru/app/tools/tools.dart';
import 'package:cook_guru/app/widget/page/page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class IngredientSelectController extends GetxController {
  Rx<PageState> state = PageState.loading.obs;

  late IngredientsService ingredientsService = Get.find<IngredientsService>();

  late RxList<Ingredient> filteredIngredients = RxList.empty();

  RxList<int> selectedIngredients = RxList.empty();
  RxList<int> foundRecipesIdList = RxList.empty();

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    waitForIngredients();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  ///Close listener when value changes
  void waitForIngredients() {
    ingredientsService.ingredientsLoading.listen((isLoading) {
      if (!isLoading) {
        filteredIngredients.value = ingredientsService.ingredients;
      }
    });
  }

  void onSearchChange(String filter) {
    getFilteredList(filter);
  }

  void getFilteredList(String filter) {
    if (filter.isEmpty) {
      filteredIngredients.value = ingredientsService.ingredients;
    } else {
      filteredIngredients.value = ingredientsService.ingredients
          .where((element) =>
              element.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  void handleNewSelect(int index) {
    filteredIngredients.elementAt(index).isSelected.toggle();
    if (filteredIngredients.elementAt(index).isSelected.isFalse) {
      selectedIngredients.remove(filteredIngredients.elementAt(index).id);
    } else {
      selectedIngredients.add(filteredIngredients.elementAt(index).id);
    }

    getRecipesByFilter();
  }

  ///todo Think about making this part without await. Will cause problems when the list gets too big
  void getRecipesByFilter() async {
    foundRecipesIdList.value = (await Get.find<RecipesService>()
            .getRecipesByIngredient(selectedIngredients))
        .map((e) => e.id)
        .toList();
  }

  void navigateToRecipes() {
    Get.toNamed(AppPages.recipeList,
        arguments: {'recipeIds': foundRecipesIdList});
  }

  @override
  void onClose() {
    super.onClose();
  }
}
