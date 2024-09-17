import 'package:cook_guru/app/constants/theme/app_colors.dart';
import 'package:cook_guru/app/constants/theme/app_styling.dart';
import 'package:cook_guru/app/tools/hex_color_translater.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckMarkWidget extends StatelessWidget {
  RxBool isSelected;

  CheckMarkWidget(this.isSelected);

  @override
  Widget build(BuildContext context) => Obx(
      () => isSelected.value ? _buildSelectedMark() : _buildUnselectedMark());

  AnimatedContainer _buildSelectedMark() => AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: AppColors.leafGreen, borderRadius: AppStyling.borderRadius),
        child: const Icon(Icons.check, color: Colors.white),
      );

  AnimatedContainer _buildUnselectedMark() => AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.leafGreen, width: 1.4),
            color: Colors.white,
            borderRadius: AppStyling.borderRadius),
      );
}
