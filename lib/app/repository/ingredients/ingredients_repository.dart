import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_guru/app/constants/db_routes/firebase_routes.dart';
import 'package:cook_guru/app/models/ingredient/ingredient_response.dart';

class IngredientsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Ingredient>> getAllIngredients() async {
    return _firestore.collection(FirebaseRoutes.ingredients).get().then(
        (value) =>
            List.from(value.docs.map((e) => Ingredient.fromJson(e.data()))));
  }
}
