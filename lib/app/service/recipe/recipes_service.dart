import 'package:cook_guru/app/models/recipes/recipes_response.dart';
import 'package:cook_guru/app/tools/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RecipesService extends GetxService {
  late List<Recipe> recipes;

  @override
  void onInit() async {
    recipes = await getRecipes();
    super.onInit();
  }

  Future<List<Recipe>> getRecipes() async {
    return RecipesResponse.fromJson(
            await loadJsonFromAssets('assets/mock/mock_recipes.json'))
        .recipes;
  }

  Future<List<Recipe>> getRecipesByIngredient(List<int> ingredientIds) async {
    List<Recipe> filteredRecipes = [];

    for (Recipe recipe in recipes) {
      List<int> sameIds = [];
      for (int ingredientId in ingredientIds) {
        if (recipe.ingredients.contains(ingredientId)) {
          sameIds.add(ingredientId);
        } else {
          break;
        }
      }
      if (sameIds.length == ingredientIds.length) {
        filteredRecipes.add(recipe);
      }
      sameIds.clear();
    }
    return filteredRecipes;
  }
}
