import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/models/WaterLog.dart';
import 'package:hydrosense_mobile_app/src/models/waterusagelog.dart';
import 'package:hydrosense_mobile_app/src/providers/waterlogs_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Dashboard/view/dashboard_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Dashboard/widgets/dashboard_widgets.dart';
import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    WaterLogsDB waterLogsDB = Provider.of<WaterLogsDB>(context);
    List<WaterLog> waterlogsList = waterLogsDB.getAllWaterUsageDataByDateRange(
      from: DateTimeUtil.getCurrentDate(),
      to: DateTimeUtil.getCurrentDate(),
    );
    WaterUsageLog overallData = waterLogsDB.getOverallDashboardData(
      from: DateTimeUtil.getCurrentDate(),
      to: DateTimeUtil.getCurrentDate(),
      tariffRate: '4.5',
    );

    waterLogsDB.addListener(() {
      setState(() {});
    });
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: DashboardStyles.titleContainerPadding,
                margin: DashboardStyles.titleContainerMargin,
                alignment: DashboardStyles.titleAlign,
                child: const Text(
                  'Dashboard',
                  textAlign: TextAlign.left,
                  style: DashboardStyles.title,
                ),
              ),
              //* Today's Overall Text
              Container(
                alignment: Alignment.topLeft,
                margin: DashboardStyles.overallContainerPadding,
                child: const Text(
                  "Today's Overall",
                  textAlign: TextAlign.left,
                  style: DashboardStyles.overallText,
                ),
              ),
              //* Overall Data Boxes
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    //* Water Used
                    Container(
                      margin: DashboardStyles.cardMargin,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: DashboardStyles.cardColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                      ),
                      child: Container(
                        padding: DashboardStyles.cardPadding,
                        child: Column(
                          children: <Widget>[
                            Text(
                                '${overallData.total_water_usage?.toStringAsFixed(2)} m3',
                                style: DashboardStyles.cardTextValue),
                            Text('Water used',
                                style: DashboardStyles.cardTextTitle)
                          ],
                        ),
                      ),
                    ),
                    //* Time Spent
                    Container(
                      margin: DashboardStyles.cardMargin,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: DashboardStyles.cardColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                      ),
                      child: Container(
                        padding: DashboardStyles.cardPadding,
                        child: Column(
                          children: [
                            Text(
                                '${overallData.total_time_spent?.toStringAsFixed(2)} hr',
                                style: DashboardStyles.cardTextValue),
                            Text('Time Spent',
                                style: DashboardStyles.cardTextTitle)
                          ],
                        ),
                      ),
                    ),
                    //* Estimated Cost
                    Container(
                      margin: DashboardStyles.cardMargin,
                      decoration: const BoxDecoration(
                        color: DashboardStyles.cardColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                      ),
                      width: double.infinity,
                      child: Container(
                        padding: DashboardStyles.cardPadding,
                        child: Column(
                          children: [
                            Text(
                                '\$ ${overallData.total_estimated_cost?.toStringAsFixed(2)}',
                                style: DashboardStyles.cardTextValue),
                            Text('Estimated Cost',
                                style: DashboardStyles.cardTextTitle)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    //* Chart for average water usage
                    DashboardWidgets.waterUsageBarChart(
                        waterloglist: waterlogsList),
                    const SizedBox(height: 50),
                    //* Estimated Cost of water usage Text
                    Container(
                      alignment: Alignment.center,
                      padding: DashboardStyles.overallContainerPadding,
                      child: const Text(
                        "Estimated Cost of water usage",
                        textAlign: TextAlign.center,
                        style: DashboardStyles.costUsageTitle,
                      ),
                    ),
                    //* Chart for estimated cost for water usage
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: DashboardWidgets.costUsageLineChart(),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
