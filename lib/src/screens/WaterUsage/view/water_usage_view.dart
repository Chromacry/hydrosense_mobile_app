import 'package:flutter/material.dart';

import 'package:hydrosense_mobile_app/src/screens/WaterUsage/view/water_usage_style.dart';
import 'package:hydrosense_mobile_app/src/screens/WaterUsage/widgets/water_usage_widgets.dart';

class WaterUsageView extends StatelessWidget {
  const WaterUsageView({super.key});

  @override
  Widget build(BuildContext context) {
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
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        alignment: Alignment.center,
                        color: Colors.black,
                        icon: Icon(
                          Icons.filter_list_rounded,
                          size: 25,
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => FilterModal(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //* Dropdown Field
              WaterUsageWidgets.dropdownTextBox(
                  hintText: 'Select Device', options: <String>['Device #1']),
              const SizedBox(height: 25),
              //* Chart for average water usage
              WaterUsageWidgets.waterUsageBarChart(),
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
              //* Chart for estimated cost for water usage
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: WaterUsageWidgets.costUsageLineChart(),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterModal extends StatelessWidget {
  const FilterModal({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter'),
      content: const Text('AlertDialog description'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Close'),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
