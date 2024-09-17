import 'package:cook_guru/app/models/recipes/recipes_response.dart';
import 'package:cook_guru/app/service/recipe/recipes_service.dart';
import 'package:get/get.dart';

class RecipeListController extends GetxController {
  RecipesService recipesService = Get.find<RecipesService>();

  RxList<Recipe> filteredRecipes = RxList.empty();

  @override
  void onInit() {
    getRecipesByIds();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getRecipesByIds() {
    for (int recipeId in Get.arguments['recipeIds']) {
      filteredRecipes.add(recipesService.recipes
          .firstWhere((element) => element.id == recipeId));
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
