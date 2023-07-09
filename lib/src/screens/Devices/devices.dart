import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/view/devices_view.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/devices_widgets.dart';

class Devices extends StatelessWidget {
  static String routeName = '/Devices';
  const Devices({
    super.key,
  });
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 1,
            ),
            Text('Devices'),
            //* Add new Device
            IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AddDeviceModal(),
              ),
              icon: Icon(
                Icons.add_box_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
          ],
        )),
        backgroundColor: Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(DesignConstants.COLOR_DARKBLUE_PRIMARY),
      body: DevicesView(),
    );
  }
}
