import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/Alerts/view/alerts_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Alerts/widgets/alert_item.dart';
import 'package:hydrosense_mobile_app/src/screens/Alerts/widgets/alert_widgets.dart';

import 'package:hydrosense_mobile_app/src/screens/WaterUsage/view/water_usage_style.dart';

class AlertsView extends StatelessWidget {
  const AlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
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
                children: [],
              ),
              //* Alerts Box
              Container(
                height: 550, // 214,
                // padding: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: AlertItem(
                            title: 'Water leak detected',
                            message: 'oh no!',
                            createdTime: '2015-06-22',
                            containerItemColor: Colors.white,
                            onDismissed: (dismissDirection) =>
                                debugPrint('dwa')),
                      );
                    },
                    itemCount: 2,
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
