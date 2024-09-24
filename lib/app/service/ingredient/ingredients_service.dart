import 'package:cook_guru/app/models/ingredient/ingredient_response.dart';
import 'package:cook_guru/app/repository/ingredients/ingredients_repository.dart';
import 'package:cook_guru/app/tools/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IngredientsService extends GetxService {
  final IngredientsRepository _repository = IngredientsRepository();

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
      ingredients = await _repository.getAllIngredients();
      debugPrint('zavrsio brat');
      ingredientsLoading.value = false;
    } catch (e) {
      ingredientsLoading.value = false;
      debugPrint('getIngredients() error: $e');
    }
  }
}
