import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/models/user.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Dashboard/widgets/dashboard_widgets.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/view/devices_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/widgets/devices_widgets.dart';
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
              //* Devices Box
              Container(
                height: 214,
                margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Color(DevicesStyles.devicesBoxColor),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Expanded(
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisCount: 4,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 4,
                    children: <Widget>[
                      DevicesWidgets.deviceButton(
                        buttonText: 'Device Locations',
                        icon: Icons.location_on_rounded,
                        onTap: () => debugPrint('Device Locations Pressed'),
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
