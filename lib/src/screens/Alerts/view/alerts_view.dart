import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/Alerts/view/alerts_style.dart';

import 'package:hydrosense_mobile_app/src/screens/WaterUsage/view/water_usage_style.dart';
import 'package:hydrosense_mobile_app/src/screens/WaterUsage/widgets/water_usage_widgets.dart';

class AlertsView extends StatelessWidget {
  const AlertsView({super.key});

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
                child: const Text(
                  'Alerts',
                  textAlign: TextAlign.left,
                  style: WaterUsageStyles.title,
                ),
              ),
              Row(
                children: [
                  
                ],
              ),
              //* Alerts Box
              Container(
                height: 550, // 214,
                // padding: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Flexible(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Placeholder(),
                      );
                    },
                  ),
                ),
              ),
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
