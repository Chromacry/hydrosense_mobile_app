import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/device.dart';
import 'package:hydrosense_mobile_app/src/providers/devices_db.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/view/devices_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/devices_widgets.dart';
import 'package:provider/provider.dart';

class DevicesView extends StatefulWidget {
  const DevicesView({super.key});

  @override
  State<DevicesView> createState() => _DevicesViewState();
}

class _DevicesViewState extends State<DevicesView> {
  bool isDeleteModeOn = false;

  @override
  Widget build(BuildContext context) {
    UsersDB usersDB = Provider.of<UsersDB>(context);
    DevicesDB devicesDB = Provider.of<DevicesDB>(context);
    List<Device> devicesDBList = devicesDB.getAllDevicesByHouseholdId(
        householdId: GlobalConstants.temp_householdID);
    //* Listen on provider
    devicesDB.addListener(() {
      debugPrint('Heloo world');
      //* Reload the page when the provider is notified
      setState(() {});
    });

    //* Toggle delete mode
    void onPressedDeleteMode() {
      if (!isDeleteModeOn)
        isDeleteModeOn = true;
      else
        isDeleteModeOn = false;
      setState(() {});
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* Sub title
                  Container(
                    padding: DevicesStyles.titleContainerPadding,
                    margin: DevicesStyles.titleContainerMargin,
                    alignment: DevicesStyles.titleAlign,
                    child: const Text(
                      'Manage Devices',
                      textAlign: TextAlign.left,
                      style: DevicesStyles.subTitle,
                    ),
                  ),
                  //* Add device button
                  IconButton(
                    onPressed: onPressedDeleteMode,
                    icon: isDeleteModeOn
                        ? Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.red[200],
                            size: 35,
                          )
                        : Icon(
                            Icons.delete_rounded,
                            color: Colors.red[200],
                            size: 35,
                          ),
                  ),
                ],
              ),
              //* Devices Box
              Container(
                height: 214,
                margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Color(DevicesStyles.devicesBoxColor),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Flexible(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 5, //5
                      mainAxisSpacing: 8, //4
                      childAspectRatio: 0.8,
                    ),
                    physics: AlwaysScrollableScrollPhysics(),
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      Device currentDevice = devicesDBList[index];
                      String deviceId = currentDevice.id.toString();
                      String deviceName = currentDevice.device_name.toString();
                      String deviceLocationId =
                          currentDevice.device_location_id.toString();
                      String deviceLocation = 'Level 2 - Kitchen';
                      String deviceHouseholdId =
                          GlobalConstants.temp_householdID;
                      String deviceSerialNumber =
                          currentDevice.device_serialnumber.toString();
                      return DevicesWidgets.deviceButton(
                        deviceNameText: deviceName,
                        deviceLocationText: deviceLocation,
                        backgroundColorIcon:
                            isDeleteModeOn ? Colors.red[200] : Colors.grey,
                        onTap: () {
                          isDeleteModeOn
                              //* Show delete modal
                              ? showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      DevicesWidgets.deleteDeviceModal(
                                        deviceId: deviceId,
                                        deviceName: deviceName,
                                        deviceHouseholdId: deviceHouseholdId,
                                        deviceSerialNumber: deviceSerialNumber,
                                        deviceLocationId: deviceLocationId,
                                      ))
                              : //* Show edit modal
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      DevicesWidgets.editDeviceModal(
                                    deviceId: deviceId,
                                    deviceName: deviceName,
                                    deviceHouseholdId: deviceHouseholdId,
                                    deviceSerialNumber: deviceSerialNumber,
                                    deviceLocationId: deviceLocationId,
                                  ),
                                );
                        },
                      );
                    },
                    itemCount: devicesDBList.length,
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

/*
DevicesWidgets.deviceButton(
  deviceNameText: 'Bathtub Tap',
  deviceLocationText: 'Level 2 - Kitchen',
  icon: Icons.location_on_rounded,
  onTap: () {
    debugPrint('Device #1 Pressed');
    const String deviceId = '';
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          DevicesWidgets.editDeviceModal(
        deviceId: deviceId,
      ),
    );
  },
),
*/
