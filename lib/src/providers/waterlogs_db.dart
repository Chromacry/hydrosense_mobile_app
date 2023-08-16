import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/WaterLog.dart';
import 'package:hydrosense_mobile_app/src/models/waterusagelog.dart';
import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';
import 'package:hydrosense_mobile_app/src/utils/WaterUsageUtil.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();
final CollectionReference<Map<String, dynamic>> firestoreDB =
    FirebaseFirestore.instance.collection('waterlogs');

class WaterLogsDB with ChangeNotifier {
  //* Data list
  List<WaterLog> waterlogs = [
    WaterLog(
      id: uuid.v4(),
      device_id: 'deviceabc12321UUID',
      time_used: '22', //* in mins
      flow_rate: '7',
      created_at: '2023-08-15 05:30:00',
    ),
    WaterLog(
      id: uuid.v4(),
      device_id: 'deviceabc12321UUID',
      time_used: '60', //* in mins
      flow_rate: '7',
      created_at: '2023-08-15 08:30:50',
    ),
    WaterLog(
      id: uuid.v4(),
      device_id: 'deviceabc12321UUID',
      time_used: '422.5', //* in mins
      flow_rate: '7',
      created_at: '2023-08-15 08:30:00',
    ),
    WaterLog(
      id: uuid.v4(),
      device_id: 'deviceabc12321UUID',
      time_used: '12', //* in mins
      flow_rate: '7',
      created_at: '2023-08-15 10:30:00',
    ),
    WaterLog(
      id: uuid.v4(),
      device_id: 'deviceabc12321UUID',
      time_used: '60', //* in mins
      flow_rate: '7',
      created_at: '2023-08-15 09:30:50',
    ),
    WaterLog(
      id: uuid.v4(),
      device_id: 'deviceabc12321UUID',
      time_used: '422.5', //* in mins
      flow_rate: '7',
      created_at: '2023-08-15 13:30:00',
    ),
  ];

  Stream<List<WaterLog>> getAllWaterLogs() {
    return firestoreDB.snapshots().map((snapshot) => snapshot.docs
        .map<WaterLog>((doc) => WaterLog.fromMap(doc.data(), doc.id))
        .toList());
  }

  Stream<List<WaterLog>> getAllWaterUsageDataByDateRange({
    required String from,
    required String to,
  }) {
    DateTime fromCreatedAt = DateTime.parse(from);
    DateTime toCreatedAt = DateTime.parse(to);
    // List<WaterLog> waterLogsByDateRange = [];
    Stream<List<WaterLog>> waterlogsStream = getAllWaterLogs();
    Stream<List<WaterLog>> filteredWaterLogsStream = waterlogsStream.map(
      (allDevices) => allDevices.where((currentWaterLog) {
        DateTime currentLogDate =
            DateTime.parse(currentWaterLog.created_at.toString());

        DateTime toDateOnly =
            DateTimeUtil.convertToDateOnly(toCreatedAt.toString());

        bool isSameDate = currentLogDate.year == toDateOnly.year &&
            currentLogDate.month == toDateOnly.month &&
            currentLogDate.day == toDateOnly.day;

        return isSameDate &&
            (currentLogDate.isAfter(fromCreatedAt) &&
                currentLogDate.isBefore(toCreatedAt));
      }).toList(),
    );
    return filteredWaterLogsStream;
  }

  //* Dashboard Overall
  Stream<WaterUsageLog> getOverallDashboardData({
    required String from,
    required String to,
    required String tariffRate,
  }) async* {
    DateTime fromCreatedAt = DateTime.parse(from);
    DateTime toCreatedAt = DateTime.parse(to);

    double totalWaterUsagePerHour = 0;
    double totalTimeUsedPerHour = 0;
    double totalEstimatedCost = 0;

    Stream<List<WaterLog>> waterlogsStream = getAllWaterLogs();
    Stream<List<WaterLog>> filteredWaterLogsStream = waterlogsStream.map(
      (allDevices) => allDevices.where((currentWaterLog) {
        DateTime currentLogDate =
            DateTime.parse(currentWaterLog.created_at.toString());

        DateTime toDateOnly =
            DateTimeUtil.convertToDateOnly(toCreatedAt.toString());

        bool isSameDate = currentLogDate.year == toDateOnly.year &&
            currentLogDate.month == toDateOnly.month &&
            currentLogDate.day == toDateOnly.day;

        return isSameDate ||
            (currentLogDate.isAfter(fromCreatedAt) &&
                currentLogDate.isBefore(toCreatedAt));
      }).toList(),
    );

    //* Calculations
    await for (var filteredLogs in filteredWaterLogsStream) {
      for (WaterLog currentWaterLog in filteredLogs) {
        //* Add total time used
        totalTimeUsedPerHour +=
            double.parse(currentWaterLog.time_used.toString()) / 60;
        //* Add water usage
        totalWaterUsagePerHour += WaterUsageUtil.getWaterUsage(
          flowRate: currentWaterLog.flow_rate.toString(),
          timeUsed: currentWaterLog.time_used.toString(),
        );
      }
      //* calculate cost of water usage
      totalEstimatedCost = WaterUsageUtil.getEstimatedCost(
        tariffRate: tariffRate,
        waterUsage: totalWaterUsagePerHour,
      );

      yield WaterUsageLog(
        total_time_spent: totalTimeUsedPerHour,
        total_water_usage: totalWaterUsagePerHour / 1000,
        total_estimated_cost: totalEstimatedCost,
      );

      //* Reset variables for next iteration
      totalWaterUsagePerHour = 0;
      totalTimeUsedPerHour = 0;
      totalEstimatedCost = 0;
    }
  }
}
