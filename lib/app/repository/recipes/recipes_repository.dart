import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_guru/app/constants/db_routes/firebase_routes.dart';
import 'package:cook_guru/app/models/recipes/recipes_response.dart';
import 'package:flutter/cupertino.dart';

class RecipesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Recipe>> getRecipesBySelectedIngredients(
      List<String> selectedIngredients) async {
    debugPrint('selectedIngredinets: $selectedIngredients');
    return _firestore
        .collection(FirebaseRoutes.recipes)
        .where('ingredients', arrayContainsAny: selectedIngredients)
        .get()
        .then((value) =>
            List.from(value.docs.map((e) => Recipe.fromJson(e.data()))));
  }
}
