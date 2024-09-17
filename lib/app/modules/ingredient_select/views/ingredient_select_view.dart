import 'dart:convert';

import 'package:cook_guru/app/constants/theme/app_colors.dart';
import 'package:cook_guru/app/routes/app_pages.dart';
import 'package:cook_guru/app/widget/loader/circular_loader_widget.dart';
import 'package:cook_guru/app/widget/page/page_widget.dart';
import 'package:cook_guru/app/widget/text_filed/search_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../localization/app_strings.dart';
import '../controllers/ingredient_select_controller.dart';
import '../../../widget/ingredient/ingredient_tile.dart';

class IngredientSelectView extends GetView<IngredientSelectController> {
  const IngredientSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IngredientSelectView'),
        centerTitle: true,
      ),
      body: PageWidget(
          body: Obx(() => controller.ingredientsService.ingredientsLoading.value
              ? CircularLoaderWidget()
              : _buildSuccessState())),
      floatingActionButton: Obx(() => _buildFAB()),
    );
  }

  Widget _buildSuccessState() => Column(
        children: [
          SearchFieldWidget(
              controller: controller.searchController,
              onChange: (value) => controller.onSearchChange(value)),
          const SizedBox(height: 32),
          _buildIngredientsSelectList()
        ],
      );

  ListView _buildIngredientsSelectList() {
    return ListView.separated(
      ///TODO replace with height logic
      shrinkWrap: true,
      itemCount: controller.filteredIngredients.length,
      itemBuilder: (_, index) => Container(
        child: IngredientTile(
          ingredient: controller.filteredIngredients.elementAt(index),
          onTap: () {
            controller.handleNewSelect(index);
          },
        ),
      ),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 12),
      // ),
    );
  }

  FloatingActionButton _buildFAB() => FloatingActionButton.extended(
      onPressed: () {
        controller.navigateToRecipes();
      },
      backgroundColor: AppColors.leafGreen,
      label: Text(
        '${controller.foundRecipesIdList.length.toString()} ${AppStrings.recipesFound.tr}',
        style: TextStyle(color: Colors.white),
      ));
}
