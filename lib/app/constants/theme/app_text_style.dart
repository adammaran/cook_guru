import 'package:cook_guru/app/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle screenTitle = TextStyle(
      fontSize: 38, color: AppColors.lightCream, fontWeight: FontWeight.w500);

  static const TextStyle descriptionWhite =
      TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300);

  static const TextStyle cardTitle = TextStyle(fontSize: 22);
  static const TextStyle description = TextStyle(fontSize: 16);

  static const TextStyle ctaLabel =
      TextStyle(fontSize: 14, color: Colors.white);
}
