import 'package:cook_guru/app/models/ingredient/ingredient_response.dart';
import 'package:cook_guru/app/tools/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IngredientsService extends GetxService {
  RxBool ingredientsLoading = RxBool(false);

  List<Ingredient> ingredients = List.empty();

  @override
  void onInit() {
    getIngredients();
    super.onInit();
  }

  void getIngredients() async {
    try {
      ingredientsLoading.value = true;
      ingredients = IngredientResponse.fromJson(
              await loadJsonFromAssets('assets/mock/mock_ingredients.json'))
          .ingredients;
      ingredientsLoading.value = false;
    } catch (e) {
      ingredientsLoading.value = false;
      debugPrint('getIngredients() error: $e');
    }
  }
}
