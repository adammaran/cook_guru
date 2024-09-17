import 'package:get/get.dart';

import '../controllers/ingredient_select_controller.dart';

class IngredientSelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IngredientSelectController>(
      () => IngredientSelectController(),
    );
  }
}
