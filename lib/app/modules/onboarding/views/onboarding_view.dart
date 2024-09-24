import 'dart:ui';

import 'package:cook_guru/app/constants/theme/app_colors.dart';
import 'package:cook_guru/app/constants/theme/app_styling.dart';
import 'package:cook_guru/app/constants/theme/app_text_style.dart';
import 'package:cook_guru/app/widget/button/cta_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/json_ast.dart';

import '../controllers/onboarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildScreenList());
  }

  Widget _buildScreenList() => Stack(
        children: [
          SizedBox(
              width: Get.width,
              height: Get.height,
              child: _buildBackgroundImage()),
          ListView.builder(
              controller: controller.scrollController,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.antiAlias,
              itemCount: controller.onBoardingScreens.length,
              itemBuilder: (_, index) => _buildPageBody(
                  controller.onBoardingScreens.elementAt(index))),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: _buildNavigation()),
        ],
      );

  Widget _buildPageBody(OnBoardingScreenWidget screen) => Container(
      width: Get.width,
      padding: const EdgeInsets.only(left: 24, top: 80, right: 24),
      child: Column(children: [
        Column(children: [
          Text(screen.title, style: AppTextStyle.screenTitle),
          const SizedBox(height: 8),
          Text(screen.description,
              style: AppTextStyle.descriptionWhite,
              textAlign: TextAlign.center,
              maxLines: 2),
        ]),
        const SizedBox(height: 24),
        Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                // color:
                //     screen.pageIndex == 0 ? null : Colors.grey.withOpacity(0.7),
                borderRadius: AppStyling.borderRadius),
            padding: const EdgeInsets.all(12),
            height: Get.height * 0.5,
            child: screen.body)
      ]));

  Widget _buildNavigation() => Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            controller.activeScreenIndex.value == 0
                ? SizedBox(
                    width: Get.width * 0.2,
                  )
                : CTAButtonWidget(() {
                    controller.onNavigateBack();
                  },
                    body: const Icon(Icons.arrow_back_rounded,
                        color: Colors.white)),
            Flexible(
                child: SizedBox(height: 24, child: _buildNavigationDots())),
            Flexible(
              child: CTAButtonWidget(() {
                controller.onNavigateForward();
              },
                  color: controller.activeScreenIndex.value ==
                          controller.onBoardingScreens.length - 1
                      ? AppColors.vibrantOrange
                      : null,
                  body: Icon(
                      controller.activeScreenIndex.value ==
                              controller.onBoardingScreens.length - 1
                          ? Icons.check
                          : Icons.arrow_forward_rounded,
                      color: Colors.white)),
            )
          ],
        ),
      );

  Widget _buildNavigationDots() => ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) => Obx(
            () => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    borderRadius: AppStyling.borderRadius,
                    color: AppColors.leafGreen.withOpacity(
                        controller.activeScreenIndex.value == index ? 1 : 0.3)),
                height: 24,
                width: controller.activeScreenIndex.value == index ? 40 : 24),
          ),
      separatorBuilder: (_, index) => const SizedBox(width: 14),
      itemCount: controller.onBoardingScreens.length);

  Widget _buildBackgroundImage() => Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken),
              image: ExactAssetImage('assets/images/onboard-background.png'))),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
        ),
      ));
}
