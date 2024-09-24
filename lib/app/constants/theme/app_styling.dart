import 'package:flutter/cupertino.dart';

class AppStyling {
  static const double _borderRadiusAmount = 16;

  static BorderRadius borderRadius = BorderRadius.circular(_borderRadiusAmount);

  static BorderRadius topBorderRadius = const BorderRadius.only(
      topLeft: Radius.circular(_borderRadiusAmount),
      topRight: Radius.circular(_borderRadiusAmount));

  static const EdgeInsets innerTilePadding = EdgeInsets.all(16);

  static const double elevation = 4;

  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: 12);
}
