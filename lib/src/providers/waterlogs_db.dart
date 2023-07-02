import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/WaterLog.dart';
import 'package:hydrosense_mobile_app/src/models/waterusagelog.dart';
import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class WaterLogsDB with ChangeNotifier {
  //* Data list
  List<WaterLog> waterlogs = [
    WaterLog(
      id: uuid.v4(),
      device_id: 'deviceabc12321UUID',
      time_used: '12', //* in mins
      flow_rate: '7',
      created_at: '2023-06-25 05:30:00',
    ),
    WaterLog(
      id: uuid.v4(),
      device_id: 'deviceabc12321UUID',
      time_used: '60', //* in mins
      flow_rate: '7',
      created_at: '2023-07-02 13:30:50',
    ),
    WaterLog(
      id: uuid.v4(),
      device_id: 'deviceabc12321UUID',
      time_used: '422.5', //* in mins
      flow_rate: '7',
      created_at: '2023-07-02 06:30:00',
    ),
  ];

  List<WaterLog> getAllWaterLogs() {
    return waterlogs;
  }

  List<WaterLog> getAllWaterUsageDataByDateRange({
    required String from,
    required String to,
  }) {
    DateTime fromCreatedAt = DateTime.parse(from);
    DateTime toCreatedAt = DateTime.parse(to);
    List<WaterLog> waterLogsByDateRange = [];
    for (WaterLog currentWaterLog in waterlogs) {
      DateTime currentLogDate =
          DateTime.parse(currentWaterLog.created_at.toString());
      if (currentLogDate.isAfter(
              DateTimeUtil.convertToDateOnly(toCreatedAt.toString())) &&
          currentLogDate.isBefore(
              DateTimeUtil.convertToDateOnly(fromCreatedAt.toString()))) {
        waterLogsByDateRange.add(currentWaterLog);
      }
    }
    return waterLogsByDateRange;
  }

  WaterUsageLog getOverallDashboardData({
    required String from,
    required String to,
    required String tariffRate,
  }) {
    DateTime fromCreatedAt = DateTime.parse(from);
    DateTime toCreatedAt = DateTime.parse(to);

    double totalWaterUsagePerHour = 0;
    double totalTimeUsedPerHour = 0;
    for (WaterLog currentWaterLog in waterlogs) {
      DateTime currentLogDate =
          DateTimeUtil.convertToDateOnly(currentWaterLog.created_at.toString());

      if (currentLogDate.compareTo(
                  DateTimeUtil.convertToDateOnly(toCreatedAt.toString())) ==
              0 ||
          currentLogDate.isAfter(
                  DateTimeUtil.convertToDateOnly(toCreatedAt.toString())) &&
              currentLogDate.isBefore(
                  DateTimeUtil.convertToDateOnly(fromCreatedAt.toString()))) {
        //* Add total time used
        totalTimeUsedPerHour +=
            double.parse(currentWaterLog.time_used.toString()) / 60;
        //* Add water usage
        totalWaterUsagePerHour +=
            (double.parse(currentWaterLog.flow_rate.toString()) * 60) *
                (double.parse(currentWaterLog.time_used.toString()) / 60);
      }
    }
    //* calculate cost of water usage
    double totalEstimatedCost =
        ((double.parse(tariffRate) / 1000) * totalWaterUsagePerHour ) + 4.5;
    //* return total data
    return WaterUsageLog(
      total_time_spent: totalTimeUsedPerHour,
      total_water_usage: totalWaterUsagePerHour / 1000, //*divided by 1000 to change litres to cubic metres
      total_estimated_cost: totalEstimatedCost,
    );
  }
}
