import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/models/WaterLog.dart';
import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';
import 'package:hydrosense_mobile_app/src/utils/WaterUsageUtil.dart';
import 'dart:math';

class WaterUsageBarChart extends StatefulWidget {
  final List<WaterLog> waterloglist;
  WaterUsageBarChart({
    Key? key,
    required this.waterloglist,
  }) : super(key: key);

  final Color? leftBarColor = Colors.yellow[200];
  final Color? rightBarColor = Colors.red[200];
  final Color? avgColor = Colors.orange;

  @override
  State<WaterUsageBarChart> createState() => _WaterUsageBarChartState();
}

class _WaterUsageBarChartState extends State<WaterUsageBarChart> {
  final double width = 10; //7

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;
  late List<String> titles = <String>[
    '12am',
  ];
  double highestWaterUsageValue = 0;

  int touchedGroupIndex = -1;
  List<double> waterUsageList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> items = [];
    List<String> itemsTitle = [];
    //* Amount of bar in chart
    //* makeGroupData(Grouping, Bar1)
    //* Add default value when there's no value from today's data
    widget.waterloglist.asMap().forEach((index, waterlog) {
      double waterUsage = WaterUsageUtil.getWaterUsage(
            flowRate: waterlog.flow_rate.toString(),
            timeUsed: waterlog.time_used.toString(),
          ) /
          1000;
      waterUsageList.add(waterUsage);
      items.add(makeGroupData(index, waterUsage));
      itemsTitle.add(DateTimeUtil.convertToHumanReadable24HrTime(
          waterlog.created_at.toString()));
    });
    if (widget.waterloglist.length >= 1)
      highestWaterUsageValue = waterUsageList.reduce(max).ceilToDouble();
    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
    titles = itemsTitle;
    return Container(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // makeTransactionsIcon(),
              const Icon(Icons.water_drop_rounded, color: Colors.white),
              const SizedBox(
                width: 38,
              ),
              Column(
                children: const [
                  Text(
                    'Average Water Usage',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'last 6 hours',
                    style: TextStyle(
                      color: Color(0xff77839a),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 38,
          ),
          waterUsageList.length > 0
              ? Expanded(
                  child: Container(
                    child: BarChart(
                      BarChartData(
                        maxY: highestWaterUsageValue,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.grey,
                            getTooltipItem: (a, b, c, d) => null,
                          ),
                          touchCallback: (FlTouchEvent event, response) {
                            if (response == null || response.spot == null) {
                              setState(() {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              });
                              return;
                            }

                            touchedGroupIndex =
                                response.spot!.touchedBarGroupIndex;

                            setState(() {
                              if (!event.isInterestedForInteractions) {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                                return;
                              }
                              showingBarGroups = List.of(rawBarGroups);
                              if (touchedGroupIndex != -1) {
                                var sum = 0.0;
                                for (final rod
                                    in showingBarGroups[touchedGroupIndex]
                                        .barRods) {
                                  sum += rod.toY;
                                }
                                final avg = sum /
                                    showingBarGroups[touchedGroupIndex]
                                        .barRods
                                        .length;

                                showingBarGroups[touchedGroupIndex] =
                                    showingBarGroups[touchedGroupIndex]
                                        .copyWith(
                                  barRods: showingBarGroups[touchedGroupIndex]
                                      .barRods
                                      .map((rod) {
                                    return rod.copyWith(
                                        toY: avg, color: widget.avgColor);
                                  }).toList(),
                                );
                              }
                            });
                          },
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: bottomTitles,
                              reservedSize: 42, //* Size of the text below
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30, //28
                              interval: 1,
                              getTitlesWidget: leftTitles,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: showingBarGroups,
                        gridData: FlGridData(show: false),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    'No data for today!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  //* Data
  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 1.5) {
      text = '1.5';
    } else if (value == highestWaterUsageValue) {
      text = '${highestWaterUsageValue} m3';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  //* By number of bars created
  Widget bottomTitles(double value, TitleMeta meta) {
    final intIndex = value.isFinite ? value.toInt() : 0;
    final title =
        intIndex >= 0 && intIndex < titles.length ? titles[intIndex] : '';

    final Widget text = Text(
      // titles[value.toInt()], // Original code
      title,
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //16 //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(
      barsSpace: 1, //4
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
      ],
    );
  }
}
