import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';

class DashboardStyles {
  //* Title Text
  static const Alignment titleAlign = Alignment.centerLeft;
  static const EdgeInsets titleContainerMargin = EdgeInsets.only(bottom: 20);
  static const EdgeInsets titleContainerPadding = EdgeInsets.only(top: 20);
  static const title = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  //* Today's Overall Text
  static const overallText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const overallContainerPadding = EdgeInsets.only(bottom: 10, top: 20);
  //* Overall Data Section
  static const Color cardColor = Color(DesignConstants.COLOR_LIGHTBLUE_ACCENT);
  static const EdgeInsets cardMargin = EdgeInsets.only(bottom: 10);
  static const EdgeInsets cardPadding = EdgeInsets.all(15);
  static const cardTextValue = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static const cardTextTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  //* Graph Titles
  static const costUsageTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
