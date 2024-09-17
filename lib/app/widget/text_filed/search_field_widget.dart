import 'package:cook_guru/app/constants/theme/app_colors.dart';
import 'package:cook_guru/app/constants/theme/app_styling.dart';
import 'package:cook_guru/app/localization/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../tools/hex_color_translater.dart';

class SearchFieldWidget extends StatelessWidget {
  TextEditingController controller;
  Function(String)? onChange;

  SearchFieldWidget({required this.controller, this.onChange});

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: AppStyling.borderRadius,
    elevation: AppStyling.elevation,
        color: AppColors.lightCream,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            // color: Colors.deepPurple,
            child: Row(
              children: [
                Flexible(
                  child: Form(
                      child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  '${AppStrings.searchIngredients.tr}...'),
                          onChanged: onChange,
                          controller: controller)),
                ),
                const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.search))
              ],
            )),
      );
}
