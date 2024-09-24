import 'package:cook_guru/app/models/recipes/recipes_response.dart';
import 'package:cook_guru/app/repository/recipes/recipes_repository.dart';
import 'package:cook_guru/app/tools/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RecipesService extends GetxService {
  final RecipesRepository _repository = RecipesRepository();

  RxBool loadingIngredients = RxBool(false);

  late List<Recipe> recipes;

  @override
  void onInit() async {
    super.onInit();
  }

  Future<List<Recipe>> getRecipesByIngredient(
      List<String> ingredientIds) async {
    // List<Recipe> filteredRecipes = [];

    // for (Recipe recipe in recipes) {
    //   List<String> sameIds = [];
    //   for (String ingredientId in ingredientIds) {
    //     if (recipe.ingredients.contains(ingredientId)) {
    //       sameIds.add(ingredientId);
    //     } else {
    //       break;
    //     }
    //   }
    //   if (sameIds.length == ingredientIds.length) {
    //     filteredRecipes.add(recipe);
    //   }
    //   sameIds.clear();
    // }

    if (ingredientIds.isEmpty) {
      return [];
    }

    loadingIngredients.value = true;
    List<Recipe> res =
        await _repository.getRecipesBySelectedIngredients(ingredientIds);
    recipes = res;
    loadingIngredients.value = false;

    return res;
  }
}
