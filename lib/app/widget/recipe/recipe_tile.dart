import 'package:cook_guru/app/constants/theme/app_colors.dart';
import 'package:cook_guru/app/constants/theme/app_styling.dart';
import 'package:cook_guru/app/constants/theme/app_text_style.dart';
import 'package:cook_guru/app/localization/app_strings.dart';
import 'package:cook_guru/app/models/recipes/recipes_response.dart';
import 'package:cook_guru/app/routes/app_pages.dart';
import 'package:cook_guru/app/widget/button/cta_button_widget.dart';
import 'package:cook_guru/app/widget/image/network_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeTile extends StatelessWidget {
  Recipe recipe;

  RecipeTile(this.recipe, {super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(tag: recipe.id, child: Material(child: _buildTileCard()));
  }

  Material _buildTileCard() => Material(
        color: AppColors.lightCream,
        elevation: AppStyling.elevation,
        borderRadius: AppStyling.borderRadius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: NetworkImageWidget(
                  recipe.headerImageUrl ?? 'https://picsum.photos/600/300'),
            ),
            _buildTileBody()
          ],
        ),
      );

  Container _buildTileBody() => Container(
        padding: AppStyling.innerTilePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(recipe.name, style: AppTextStyle.cardTitle),
                Text(recipe.duration, style: AppTextStyle.cardTitle),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              recipe.description,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.description,
              maxLines: 2,
            ),
            const SizedBox(height: 4),
            Align(
                alignment: Alignment.centerRight,
                child: CTAButtonWidget(
                    () =>
                        Get.toNamed(AppPages.recipeDetails, arguments: recipe),
                    AppStrings.viewMore.tr))
          ],
        ),
      );
}
