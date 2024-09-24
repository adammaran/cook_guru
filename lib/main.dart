import 'package:cook_guru/app/localization/app_strings.dart';
import 'package:cook_guru/app/routes/app_pages.dart';
import 'package:cook_guru/app/service/ingredient/ingredients_service.dart';
import 'package:cook_guru/app/service/recipe/recipes_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/localization/localization.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setTranslations();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  _initServices();

  runApp(const MyApp());
}

_initServices() {
  Get.put(IngredientsService());
  Get.put(RecipesService());
}

_setTranslations() async {
  Get.put(AppTranslations());

  await AppTranslations.loadTranslations();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('en'),
      supportedLocales: const [Locale('en')],
      translationsKeys: Get.find<AppTranslations>().keys,
      translations: Get.find<AppTranslations>(),
      title: AppStrings.appTitle.tr,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.onBoarding,
    );
  }
}
