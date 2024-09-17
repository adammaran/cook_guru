import 'package:cook_guru/app/constants/theme/app_styling.dart';
import 'package:cook_guru/app/tools/hex_color_translater.dart';
import 'package:flutter/cupertino.dart';

enum PageState { loading, success, error }

class PageWidget extends StatelessWidget {
  late Widget body;

  PageWidget({required this.body, super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Container(
          color: HexColor.fromHex('#FEFEFE'),
          margin: AppStyling.pagePadding,
          child: body));
}
