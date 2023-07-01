import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/device.dart';
import 'package:hydrosense_mobile_app/src/models/device_location.dart';
import 'package:hydrosense_mobile_app/src/providers/device_locations_db.dart';
import 'package:hydrosense_mobile_app/src/providers/devices_db.dart';
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
  SnackBar? snackBar;
  @override
  Widget build(BuildContext context) {
    DevicesDB devicesDB = Provider.of<DevicesDB>(context);
    DeviceLocationsDB deviceLocationsDB =
        Provider.of<DeviceLocationsDB>(context);

    //* grab all devices by household
    List<Device> devicesDBList = devicesDB.getAllDevicesByHouseholdId(
        householdId: GlobalConstants.temp_householdID);

    //* grab all device locations by household
    List<DeviceLocation> deviceLocationsList =
        deviceLocationsDB.getAllDeviceLocationsByHouseholdId(
            householdId: GlobalConstants.temp_householdID);

    //* For dropdown list of locations
    List<List<String>> dropdownLocationOptions =
        deviceLocationsList.map((currentLocationValues) {
      return [
        currentLocationValues.id ?? '',
        currentLocationValues.device_location_name ?? '',
      ];
    }).toList();

    //* Listen on provider
    devicesDB.addListener(() {
      //* Reload the page when the provider is notified
      setState(() {});
    });

    //* Toggle delete mode
    void onPressedDeleteMode() {
      if (!isDeleteModeOn) {
        isDeleteModeOn = true;
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //       content: Text('Delete Mode enabled!'),
        //       duration: Duration(days: 365),
        //       backgroundColor: Colors.red),
        // );
      } else {
        isDeleteModeOn = false;
        // ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      }
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
              //* Alert
              isDeleteModeOn
                  ? Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: double.maxFinite,
                      child: Card(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Delete Mode enabled!',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              //* Devices Box
              Container(
                height: 550, // 214,
                // margin: EdgeInsets.only(bottom: 50),
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
                      String deviceLocation = deviceLocationsDB
                          .getDeviceLocationById(
                            deviceLocationId: deviceLocationId,
                          )
                          .device_location_name
                          .toString();
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
                                    dropdownLocationOptions:
                                        dropdownLocationOptions,
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
