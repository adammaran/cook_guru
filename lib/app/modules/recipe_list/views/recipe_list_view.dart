import 'package:cook_guru/app/widget/page/page_widget.dart';
import 'package:cook_guru/app/widget/recipe/recipe_tile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recipe_list_controller.dart';

class RecipeListView extends GetView<RecipeListController> {
  const RecipeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RecipeListView'),
          centerTitle: true,
        ),
        body: PageWidget(body: _buildRecipeList()));
  }

  Widget _buildRecipeList() => ListView.separated(
      itemBuilder: (_, index) =>
          RecipeTile(controller.filteredRecipes.elementAt(index)),
      separatorBuilder: (_, index) => const SizedBox(height: 12),
      itemCount: controller.filteredRecipes.length);
}
