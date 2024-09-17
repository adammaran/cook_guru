import 'package:get/get.dart';

class IngredientResponse {
  List<Ingredient> ingredients;

  IngredientResponse(this.ingredients);

  factory IngredientResponse.fromJson(Map<String, dynamic> json) =>
      IngredientResponse(
          List.from(json['ingredients'].map((e) => Ingredient.fromJson(e))));
}

class Ingredient {
  int id;
  String name;

  RxBool isSelected = RxBool(false);

  Ingredient(this.id, this.name);

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      Ingredient(json['id'], json['name']);
}
