import 'package:flutter/material.dart';

class DefaultResponsiveSizes {
  final BuildContext context;
  DefaultResponsiveSizes(this.context);

  double get kDefaultHeight => MediaQuery.of(context).size.height;
  double get kDefaultWidth => MediaQuery.of(context).size.width;

  double get kDefaultSmallHeight => MediaQuery.of(context).size.height / 10;
  double get kDefaultSmallWidth => MediaQuery.of(context).size.width / 10;

  double get kDefaultNormalHeight =>
      MediaQuery.of(context).size.height / 10 * 1.75;
  double get kDefaultNormalWidth =>
      MediaQuery.of(context).size.width / 10 * 1.75;

  double get kSpacesize => 5.0;

  //SCREEN
  double get kHorizontal => 16.0;
  double get kSpaceBetweenFormFields => 48.0;
  double get kTextFormFieldHeight => 56;
  double get kTextFormFieldWidth => MediaQuery.of(context).size.width;

  double get authAppBarSize => 100.0;
}
