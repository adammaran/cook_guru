import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

List<Locale> supportedLocales = [const Locale("en")];

class AppTranslations extends Translations {
  Map<String, Map<String, String>> data = <String, Map<String, String>>{};

  @override
  Map<String, Map<String, String>> get keys => data;

  static Future loadTranslations() async {
    Map<String, Map<String, String>> data = <String, Map<String, String>>{};

    for (var locale in supportedLocales) {
      String path = "assets/language/${locale.languageCode}.json";
      String jsonString = await rootBundle.loadString(path);
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      data[locale.languageCode] =
          jsonMap.map((key, value) => MapEntry(key, value.toString()));
    }

    Get.addTranslations(data);
  }
}
