import 'package:get/get.dart';

import '../modules/ingredient_select/bindings/ingredient_select_binding.dart';
import '../modules/ingredient_select/views/ingredient_select_view.dart';
import '../modules/recipe_details/bindings/recipe_details_binding.dart';
import '../modules/recipe_details/views/recipe_details_view.dart';
import '../modules/recipe_list/bindings/recipe_list_binding.dart';
import '../modules/recipe_list/views/recipe_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const ingredientSelect = Routes.INGREDIENT_SELECT;
  static const recipeList = Routes.RECIPE_LIST;
  static const recipeDetails = Routes.RECIPE_DETAILS;

  static final routes = [
    GetPage(
        name: _Paths.INGREDIENT_SELECT,
        page: () => const IngredientSelectView(),
        binding: IngredientSelectBinding()),
    GetPage(
      name: _Paths.RECIPE_LIST,
      page: () => const RecipeListView(),
      binding: RecipeListBinding(),
    ),
    GetPage(
      name: _Paths.RECIPE_DETAILS,
      page: () => const RecipeDetailsView(),
      binding: RecipeDetailsBinding(),
    ),
  ];
}
