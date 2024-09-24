import 'package:cook_guru/app/constants/theme/app_text_style.dart';
import 'package:cook_guru/app/localization/app_strings.dart';
import 'package:cook_guru/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class WelcomeStepView extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const FlutterLogo(
            size: 200,
          ),
          Text(
            AppStrings.welcomeOnBoardingDesc.tr,
            style: AppTextStyle.descriptionWhite.copyWith(fontSize: 18),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
