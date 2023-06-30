import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/DeviceLocations/view/device_locations_view.dart';
import 'package:hydrosense_mobile_app/src/screens/DeviceLocations/widgets/device_locations_widgets.dart';

class DeviceLocations extends StatelessWidget {
  static String routeName = '/DeviceLocations';
  const DeviceLocations({
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
            Text('Device Locations'),
            //* Add new Device
            IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    DeviceLocationsWidgets.addDeviceLocationModal(),
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
      body: DeviceLocationsView(),
    );
  }
}
