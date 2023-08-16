import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/models/WaterLog.dart';
import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';
import 'package:hydrosense_mobile_app/src/utils/WaterUsageUtil.dart';

class CostUsageLineChart extends StatefulWidget {
  final List<WaterLog> waterloglist;
  CostUsageLineChart({
    super.key,
    required this.waterloglist,
  });

  @override
  State<CostUsageLineChart> createState() => _CostUsageLineChartState();
}

class _CostUsageLineChartState extends State<CostUsageLineChart> {
  List<Color> gradientColors = [
    Color(DesignConstants.COLOR_LIGHTBLUE_ACCENT),
    Colors.cyan,
  ];

  bool showAvg = false;

  late List<String> titles = <String>[
    '12am',
  ];
  double highestWaterUsageValue = 0;
  List<double> waterUsageList = [];

  @override
  Widget build(BuildContext context) {
    List<FlSpot> items = [];
    List<String> itemsTitle = [];

    widget.waterloglist.asMap().forEach((index, waterlog) {
      double waterUsage = WaterUsageUtil.getWaterUsage(
            flowRate: waterlog.flow_rate.toString(),
            timeUsed: waterlog.time_used.toString(),
          ) /
          1000;
      waterUsageList.add(waterUsage);
      items.add(FlSpot(index.toDouble(), waterUsage));
      itemsTitle.add(DateTimeUtil.convertToHumanReadable24HrTime(
          waterlog.created_at.toString()));
    });
    if (widget.waterloglist.length >= 1)
      highestWaterUsageValue = waterUsageList.reduce(max).ceilToDouble();
    titles = itemsTitle;
    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          child: LineChart(LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              horizontalInterval: 1,
              verticalInterval: 1,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.grey,
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Colors.grey,
                  strokeWidth: 1,
                );
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
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: leftTitleWidgets,
                  reservedSize: 42,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d)),
            ),
            // minX: 0,
            // maxX: 10, //* Max Colomns
            // minY: 0,
            maxY: highestWaterUsageValue,
            lineBarsData: [
              LineChartBarData(
                spots: items,
                isCurved: true,
                gradient: LinearGradient(
                  colors: gradientColors,
                ),
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: gradientColors
                        .map((color) => color.withOpacity(0.3))
                        .toList(),
                  ),
                ),
              ),
            ],
          )),
        ),
        // SizedBox(
        //   width: 60,
        //   height: 34,
        //   child: TextButton(
        //     onPressed: () {
        //       setState(() {
        //         showAvg = !showAvg;
        //       });
        //     },
        //     child: Text(
        //       'Avg',
        //       style: TextStyle(
        //         fontSize: 12,
        //         color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final intIndex = value.isFinite ? value.toInt() : 0;
    final title =
        intIndex >= 0 && intIndex < titles.length ? titles[intIndex] : '';

    final Widget text = Text(
      // titles[value.toInt()], // Original code
      title,
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //16 //margin top
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.white,
    );
    String text;
    if (value == 0) {
      text = '\$0';
    } else if (value == 10) {
      text = '\$10';
    } else if (value == highestWaterUsageValue) {
      text = '\$${highestWaterUsageValue}';
    } else {
      return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
