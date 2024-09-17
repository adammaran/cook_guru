import 'package:cook_guru/app/models/recipes/recipes_response.dart';
import 'package:get/get.dart';

class RecipeDetailsController extends GetxController {
  late Recipe recipe;

  @override
  void onInit() {
    recipe = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
