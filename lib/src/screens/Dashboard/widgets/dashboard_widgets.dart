import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/models/WaterLog.dart';
import 'package:hydrosense_mobile_app/src/screens/Dashboard/widgets/cost_usage_linechart.dart';
import 'package:hydrosense_mobile_app/src/screens/Dashboard/widgets/water_usage_barchart.dart';

class DashboardWidgets {
  static Widget waterUsageBarChart({required List<WaterLog> waterloglist}) {
    return WaterUsageBarChart(
      waterloglist: waterloglist,
    );
  }

  static Widget costUsageLineChart() {
    return CostUsageLineChart();
  }
}
