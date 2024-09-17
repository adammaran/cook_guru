import 'package:cook_guru/app/constants/theme/app_styling.dart';
import 'package:cook_guru/app/constants/theme/app_text_style.dart';
import 'package:cook_guru/app/widget/image/network_image_widget.dart';
import 'package:cook_guru/app/widget/page/page_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recipe_details_controller.dart';

class RecipeDetailsView extends GetView<RecipeDetailsController> {
  const RecipeDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Hero(
            tag: controller.recipe.id,
            child: Material(
              child: Column(
                children: [
                  _buildPageHeader(),
                  Flexible(child: _buildPageBody())
                ],
              ),
            )),
      ),
    );
  }

  Stack _buildPageHeader() => Stack(
        alignment: Alignment.topCenter,
        children: [
          NetworkImageWidget(controller.recipe.headerImageUrl ?? '',
              isFullSized: true),
          AppBar(
            iconTheme:
                const IconThemeData(color: Colors.white //change your color here
                    ),
            title: Text(
              controller.recipe.name,
              style: AppTextStyle.cardTitle.copyWith(color: Colors.white),
            ),
            backgroundColor: Colors.transparent,
          ),
        ],
      );

  Container _buildPageBody() => Container(
        margin: AppStyling.pagePadding,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(controller.recipe.name, style: AppTextStyle.cardTitle),
                Text(controller.recipe.duration)
              ],
            ),
            const SizedBox(height: 12),
            Text(controller.recipe.description, style: AppTextStyle.description)
          ],
        ),
      );
}
