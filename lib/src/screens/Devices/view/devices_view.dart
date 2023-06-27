import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/view/devices_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/devices_widgets.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:provider/provider.dart';

class DevicesView extends StatelessWidget {
  const DevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    UsersDB usersDBList = Provider.of<UsersDB>(context);
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
                  child: GridView.count(
                    physics: AlwaysScrollableScrollPhysics(),
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisCount: 4,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 5, //5
                    mainAxisSpacing: 8, //4
                    children: <Widget>[
                      DevicesWidgets.deviceButton(
                        deviceNameText: 'Bathtub Tap',
                        deviceLocationText: 'Level 2 - Kitchen',
                        icon: Icons.location_on_rounded,
                        onTap: () => debugPrint('Device #1 Pressed'),
                      ),
                      DevicesWidgets.deviceButton(
                        deviceNameText: 'Bathtub Tap',
                        deviceLocationText: 'Lvl 2 - Kitchen',
                        icon: Icons.location_on_rounded,
                        onTap: () => debugPrint('Device #1 Pressed'),
                      ),
                      DevicesWidgets.deviceButton(
                        deviceNameText: 'Bathtub Tap',
                        deviceLocationText: 'Lvl 2 - Kitchen',
                        icon: Icons.location_on_rounded,
                        onTap: () => debugPrint('Device #1 Pressed'),
                      ),
                      DevicesWidgets.deviceButton(
                        deviceNameText: 'Bathtub Tap',
                        deviceLocationText: 'Lvl 2 - Kitchen',
                        icon: Icons.location_on_rounded,
                        onTap: () => debugPrint('Device #1 Pressed'),
                      ),
                      DevicesWidgets.deviceButton(
                        deviceNameText: 'Bathtub Tap',
                        deviceLocationText: 'Lvl 2 - Kitchen',
                        icon: Icons.location_on_rounded,
                        onTap: () => debugPrint('Device #1 Pressed'),
                      ),
                      DevicesWidgets.deviceButton(
                        deviceNameText: 'Bathtub Tap',
                        deviceLocationText: 'Lvl 2 - Kitchen',
                        icon: Icons.location_on_rounded,
                        onTap: () => debugPrint('Device #1 Pressed'),
                      ),
                      DevicesWidgets.deviceButton(
                        deviceNameText: 'Bathtub Tap',
                        deviceLocationText: 'Lvl 2 - Kitchen',
                        icon: Icons.location_on_rounded,
                        onTap: () => debugPrint('Device #1 Pressed'),
                      ),
                      DevicesWidgets.deviceButton(
                        deviceNameText: 'Bathtub Tap',
                        deviceLocationText: 'Lvl 2 - Kitchen',
                        icon: Icons.location_on_rounded,
                        onTap: () => debugPrint('Device #1 Pressed'),
                      ),
                    ],
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

class AddDeviceModal extends StatelessWidget {
  const AddDeviceModal({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Add Device',style: DevicesStyles.addDeviceTitle),
          const SizedBox(height: 10,),
          Divider(
            color: Colors.white,
            thickness: 1.5,
          ),
        ],
      ),
      content: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* Sub Title Information
              Container(
                padding: DevicesStyles.titleContainerPadding,
                margin: DevicesStyles.titleContainerMargin,
                alignment: DevicesStyles.titleAlign,
                child: const Text(
                  'Information',
                  textAlign: TextAlign.left,
                  style: DevicesStyles.addDeviceSubTitle,
                ),
              ),
              //* Device Name textbox
              SharedWidgets.inputTextBox(
                textLabel: 'Device Name', 
                allColorAttributes: Colors.black,
                onChanged: (value) => debugPrint('Hi ${value}'),
              ),
              const SizedBox(height: 20,),
              //* Details
              Container(
                padding: DevicesStyles.titleContainerPadding,
                margin: DevicesStyles.titleContainerMargin,
                alignment: DevicesStyles.titleAlign,
                child: const Text(
                  'Details',
                  textAlign: TextAlign.left,
                  style: DevicesStyles.addDeviceSubTitle,
                ),
              ),
              SharedWidgets.inputTextBox(
                textLabel: 'Device UUID', 
                allColorAttributes: Colors.black,
                onChanged: (value) => debugPrint('Hi ${value}'),
              ),
              const SizedBox(
                height: 15,
              ),
              SharedWidgets.inputTextBox(
                textLabel: 'Device Serial Number', 
                allColorAttributes: Colors.black,
                onChanged: (value) => debugPrint('Hi ${value}'),
              ),

              //* Device Location
              Container(
                padding: DevicesStyles.titleContainerPadding,
                margin: DevicesStyles.titleContainerMargin,
                alignment: DevicesStyles.titleAlign,
                child: const Text(
                  'Device Location',
                  textAlign: TextAlign.left,
                  style: DevicesStyles.addDeviceSubTitle,
                ),
              ),
              SharedWidgets.dropdownTextBox(options: ['Kitchen','Bathroom','Level 2 - Bathroom','Guest Bathroom', 'Master Bedroom'],hintText: 'Select location of device'),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Add'),
        ),
      ],
    );
  }
}
