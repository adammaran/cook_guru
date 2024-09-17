import 'package:cook_guru/app/constants/theme/app_colors.dart';
import 'package:cook_guru/app/constants/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CTAButtonWidget extends StatelessWidget {
  Function() onPressed;
  String label;

  CTAButtonWidget(this.onPressed, this.label);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.leafGreen),
        child: Text(
          label,
          style: AppTextStyle.ctaLabel,
        ));
  }
}
