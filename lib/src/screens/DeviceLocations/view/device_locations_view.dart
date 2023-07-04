import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/device_location.dart';
import 'package:hydrosense_mobile_app/src/providers/device_locations_db.dart';
import 'package:hydrosense_mobile_app/src/screens/DeviceLocations/widgets/device_locations_widgets.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/view/devices_style.dart';
import 'package:provider/provider.dart';

class DeviceLocationsView extends StatefulWidget {
  const DeviceLocationsView({super.key});

  @override
  State<DeviceLocationsView> createState() => _DeviceLocationsViewState();
}

class _DeviceLocationsViewState extends State<DeviceLocationsView> {
  bool isDeleteModeOn = false;
  @override
  Widget build(BuildContext context) {
    DeviceLocationsDB deviceLocationsDB =
        Provider.of<DeviceLocationsDB>(context);
    List<DeviceLocation> deviceLocationsList =
        deviceLocationsDB.getAllDeviceLocationsByHouseholdId(
            householdId: GlobalConstants.temp_householdID);
    
    
    //* Listen on provider
    deviceLocationsDB.addListener(() {
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
                      'Manage Locations',
                      textAlign: TextAlign.left,
                      style: DevicesStyles.subTitle,
                    ),
                  ),
                  //* Add location button
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
                // padding: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Color(DevicesStyles.devicesBoxColor),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    primary: false,
                    padding: const EdgeInsets.all(10),

                    itemBuilder: (context, index) {
                      DeviceLocation currentDeviceLocation =
                          deviceLocationsList[index];
                      String locationId = currentDeviceLocation.id.toString();
                      String householdId =
                          currentDeviceLocation.household_id.toString();
                      String deviceLocationName =
                          currentDeviceLocation.device_location_name.toString();
                      String deviceCreatedAt =
                          currentDeviceLocation.created_at.toString();
                      // String locationCreatedAt = DateTime.parse(
                      //         currentDeviceLocation.created_at.toString())
                      //     .toString();

                      //* Reverse string
                      return Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: DeviceLocationsWidgets.deviceLocationItem(
                          locationName: deviceLocationName,
                          locationHouseholdId: householdId,
                          locationCreatedAt: deviceCreatedAt,
                          containerItemColor:
                              isDeleteModeOn ? Colors.red[200] : Colors.grey,
                          onTap: () {
                            isDeleteModeOn
                                //* Show delete modal
                                ? showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        DeviceLocationsWidgets
                                            .deleteDeviceLocationModal(
                                          deviceLocationId: locationId,
                                          deletedBy: '',
                                        ))
                                : //* Show edit modal
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        DeviceLocationsWidgets
                                            .editDeviceLocationModal(
                                      deviceLocationId: locationId,
                                      deviceLocationName: deviceLocationName,
                                      deviceHouseholdId: householdId,
                                      updatedBy: 'Particiaaa Chew',
                                    ),
                                  );
                          },
                        ),
                      );
                    },
                    itemCount: deviceLocationsList.length,
                    // children: <Widget>[
                    //   DeviceLocationsWidgets.deviceLocationItem(),
                    // ],
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
