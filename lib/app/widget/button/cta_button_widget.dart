import 'package:cook_guru/app/constants/theme/app_colors.dart';
import 'package:cook_guru/app/constants/theme/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CTAButtonWidget extends StatelessWidget {
  Function() onPressed;
  String? label;
  Widget? body;
  Color? color;

  CTAButtonWidget(this.onPressed, {this.label, this.body, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? AppColors.leafGreen),
        child: body ??
            Text(
              label ?? '',
              style: AppTextStyle.ctaLabel,
            ));
  }
}
