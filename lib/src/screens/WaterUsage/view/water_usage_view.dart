import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/models/WaterLog.dart';
import 'package:hydrosense_mobile_app/src/providers/waterlogs_db.dart';

import 'package:hydrosense_mobile_app/src/screens/WaterUsage/view/water_usage_style.dart';
import 'package:hydrosense_mobile_app/src/screens/WaterUsage/widgets/water_usage_widgets.dart';
import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';
import 'package:provider/provider.dart';

class WaterUsageView extends StatefulWidget {
  const WaterUsageView({super.key});

  @override
  State<WaterUsageView> createState() => _WaterUsageViewState();
}

class _WaterUsageViewState extends State<WaterUsageView> {
  DateTime? fromDate;
  DateTime? toDate;
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  DateTime? fromDateTime;
  DateTime? toDateTime;
  void presentDateRangePicker() {
    showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 14)),
      lastDate: DateTime.tryParse(DateTimeUtil.getCurrentDate()) as DateTime,
    ).then((pickedDateRange) {
      if (pickedDateRange == null) return;
      setState(() {
        fromDate = pickedDateRange.start;
        toDate = pickedDateRange.end;
        // fromDateTime = null;
        // toDateTime = null;
        fromTime = TimeOfDay.now();
        toTime = TimeOfDay.now();
      });
      showTimePicker(
        helpText: 'Select From Time Range',
        context: context,
        initialTime: TimeOfDay.now(),
      ).then((pickedFromTime) {
        if (pickedFromTime == null) return;
        setState(() {
          fromTime = pickedFromTime;
          fromDateTime = DateTime(
            fromDate!.year,
            fromDate!.month,
            fromDate!.day,
            fromTime!.hour,
            fromTime!.minute,
          );
        });
        showTimePicker(
          helpText: 'Select To Time Range',
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((pickedToTime) {
          if (pickedToTime == null) return;
          setState(() {
            toTime = pickedToTime;
            toDateTime = DateTime(
              toDate!.year,
              toDate!.month,
              toDate!.day,
              toTime!.hour,
              toTime!.minute,
            );
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    WaterLogsDB waterLogsDB = WaterLogsDB();

    // Stream<List<WaterLog>> waterlogsList =
    //     waterLogsDB.getAllWaterUsageDataByDateRange(
    //   from: fromDateTime.toString(),
    //   to: toDateTime.toString(),
    // );
    return StreamBuilder<List<WaterLog>>(
        stream: waterLogsDB.getAllWaterUsageDataByDateRange(
          from: fromDateTime?.toString() ??
              DateTimeUtil.getCurrentDate() + ' 00:00:00',
          to: toDateTime?.toString() ??
              DateTimeUtil.getCurrentDate() + ' 23:59:00',
        ),
        builder: (context, snapshot) {
          debugPrint('REFRESHED ' + toDateTime.toString());
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //* Screen Title
                    Container(
                      padding: WaterUsageStyles.titleContainerPadding,
                      margin: WaterUsageStyles.titleContainerMargin,
                      alignment: WaterUsageStyles.titleAlign,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Water Usage',
                            textAlign: TextAlign.left,
                            style: WaterUsageStyles.title,
                          ),
                          //* Filter Button
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              alignment: Alignment.center,
                              color: Colors.black,
                              icon: Icon(
                                Icons.filter_list_rounded,
                                size: 25,
                              ),
                              onPressed: () => presentDateRangePicker(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //* Dropdown Field
                    DropdownTextBox(
                        hintText: 'Select Device',
                        options: <String>['Device #1']),
                    const SizedBox(height: 25),
                    //* Chart for average water usage
                    KeyedSubtree(
                      key: UniqueKey(), // Use a key that changes with your data
                      child: WaterUsageBarChart(waterloglist: snapshot.data!),
                    ),
                    const SizedBox(height: 50),
                    //* Estimated Cost of water usage Text
                    Container(
                      alignment: Alignment.center,
                      padding: WaterUsageStyles.overallContainerPadding,
                      child: const Text(
                        "Estimated Cost of water usage",
                        textAlign: TextAlign.center,
                        style: WaterUsageStyles.costUsageTitle,
                      ),
                    ),
                    const SizedBox(height: 50),
                    //* Chart for estimated cost for water usage
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: KeyedSubtree(
                        key:
                            UniqueKey(), // Use a key that changes with your data
                        child: CostUsageLineChart(waterloglist: snapshot.data!),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
