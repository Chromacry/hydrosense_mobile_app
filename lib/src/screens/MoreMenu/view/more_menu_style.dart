import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';

class MoreMenuStyles {
  //* Title Text
  static const Alignment titleAlign = Alignment.centerLeft;
  static const EdgeInsets titleContainerMargin = EdgeInsets.only(bottom: 20);
  static const EdgeInsets titleContainerPadding = EdgeInsets.only(top: 20);
  static const title = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  //* AccountInfo Box
  static const accountInfoBoxColor = DesignConstants.COLOR_DARKGRAY_SECONDARY;
  //* AccountInfo Titles
  static const accountInfoTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  //* AccountInfo Data
  static const accountInfoDataTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  //* MoreMenu Titles
  static const moreMenuTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  //* MoreMenu Box
  static const moreMenuBoxColor = DesignConstants.COLOR_DARKGRAY_SECONDARY;

  //* Preferences Titles
  static const preferencesTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  //* Preferences Data
  static const preferencesDataTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
