import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/screens/Dashboard/widgets/cost_usage_linechart.dart';
import 'package:hydrosense_mobile_app/src/screens/Dashboard/widgets/water_usage_barchart.dart';

class DashboardWidgets {
  static Widget waterUsageBarChart() {
    return WaterUsageBarChart();
  }
  static Widget costUsageLineChart() {
    return CostUsageLineChart();
  }
}
