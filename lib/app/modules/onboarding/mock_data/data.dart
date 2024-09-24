import 'package:get/get.dart';

import '../../../localization/app_strings.dart';
import '../../../models/recipes/recipes_response.dart';

class Data {
  List<IngredientMock> mockIngredients = [
    IngredientMock(AppStrings.chicken.tr),
    IngredientMock(AppStrings.egg.tr),
    IngredientMock(AppStrings.cheese.tr),
    // IngredientMock(AppStrings.potato.tr)
  ];

  List<Recipe> mockRecipes = [
    Recipe.mock('1', 'Cevapi', 'opis o cevapima',
        'assets/images/mock_recipe_images/cevapi.png'),
    Recipe.mock('2', 'Steak', 'opis o steaku',
        'assets/images/mock_recipe_images/steak.png')
  ];
}

class IngredientMock {
  String name;
  RxBool isSelected = RxBool(false);

  IngredientMock(this.name);
}
