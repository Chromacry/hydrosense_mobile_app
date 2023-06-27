import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/WaterUsage/widgets/cost_usage_linechart.dart';
import 'package:hydrosense_mobile_app/src/screens/WaterUsage/widgets/dropdown_textbox.dart';
import 'package:hydrosense_mobile_app/src/screens/WaterUsage/widgets/water_usage_barchart.dart';

class WaterUsageWidgets {
  static Widget waterUsageBarChart() => WaterUsageBarChart();
  static Widget costUsageLineChart() => CostUsageLineChart();
  static Widget dropdownTextBox({hintText, required List<String> options}) =>
      DropdownTextBox(
        hintText: hintText,
        options: options,
      );
}
