import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/ChangePassword/change_password.dart';
import 'package:hydrosense_mobile_app/src/screens/DeviceLocations/device_locations.dart';
import 'package:hydrosense_mobile_app/src/screens/Devices/devices.dart';
import 'package:hydrosense_mobile_app/src/screens/HouseholdMembers/household_members.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/login.dart';
import 'package:hydrosense_mobile_app/src/screens/MoreMenu/view/more_menu_style.dart';
import 'package:hydrosense_mobile_app/src/screens/MoreMenu/widgets/more_menu_widgets.dart';
import 'package:hydrosense_mobile_app/src/screens/MoreMenu/widgets/tariff_rate_modal.dart';
import 'package:hydrosense_mobile_app/src/screens/UpdateInfo/update_info.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:random_avatar/random_avatar.dart';

class MoreMenuView extends StatelessWidget {
  const MoreMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //* Profile Banner & Photo
              Container(
                //* Banner to add margin
                margin: EdgeInsets.only(top: 5, bottom: 70),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //* Banner
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(
                          'assets/images/default_profile_banner.jpg',
                        ),
                      ),
                    ),
                    
                    //* Profile Image
                    Positioned(
                      bottom: -50,
                      left: 0,
                      right: 0,
                      child: CircleAvatar(
                          radius: 65, child: RandomAvatar('saytoonz')),
                    ),
                  ],
                ),
              ),
              Text(
                'Patricia Chew',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'EmailAddress@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              //* Logout Button
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: Login(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  ),
                  child: Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22)),
                  ),
                ),
              ),
              //* Account Info Title
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Account Info',
                    style: MoreMenuStyles.accountInfoTitle),
              ),
              //* Account Info Box
              Container(
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: Color(MoreMenuStyles.accountInfoBoxColor),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Role',
                          style: MoreMenuStyles.accountInfoDataTitle,
                        ),
                        Text(
                          'Household Admin',
                          style: MoreMenuStyles.accountInfoDataTitle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Contact Number',
                          style: MoreMenuStyles.accountInfoDataTitle,
                        ),
                        Text(
                          '12345678',
                          style: MoreMenuStyles.accountInfoDataTitle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //* More Menu Title
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('More Menu', style: MoreMenuStyles.moreMenuTitle),
              ),
              //* More Menu Box
              Container(
                height: 215,
                margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Color(MoreMenuStyles.moreMenuBoxColor),
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
                      MoreMenuWidgets.moreMenuButton(
                        buttonText: 'Devices',
                        icon: Icons.devices_other_rounded,
                        onTap: () => PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: Devices(),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        ),
                      ),
                      MoreMenuWidgets.moreMenuButton(
                        buttonText: 'Device Locations',
                        icon: Icons.location_on_rounded,
                        onTap: () => PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: DeviceLocations(),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        ),
                      ),
                      MoreMenuWidgets.moreMenuButton(
                        buttonText: 'Household Members',
                        icon: Icons.people_rounded,
                        onTap: () => PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: HouseholdMembers(),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        ),
                      ),
                      MoreMenuWidgets.moreMenuButton(
                        buttonText: 'Update Info',
                        icon: Icons.account_circle_rounded,
                        onTap: () => PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: UpdateInfo(),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        ),
                      ),
                      MoreMenuWidgets.moreMenuButton(
                        buttonText: 'Water Logs',
                        icon: Icons.library_books_rounded,
                        onTap: () => debugPrint('Water Logs Pressed'),
                      ),
                      MoreMenuWidgets.moreMenuButton(
                        buttonText: 'Tariff Rate',
                        icon: Icons.attach_money_rounded,
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => TariffRateModal(
                            householdId: GlobalConstants.temp_householdID,
                            tariffRate: '0.5',
                          ),
                        ),
                      ),
                      MoreMenuWidgets.moreMenuButton(
                        buttonText: 'Change Password',
                        icon: Icons.lock_reset_rounded,
                        onTap: () => PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: ChangePassword(),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        ),
                      ),
                      MoreMenuWidgets.moreMenuButton(
                        buttonText: 'Settings',
                        icon: Icons.settings_rounded,
                        onTap: () => debugPrint('Settings Pressed'),
                      ),
                    ],
                  ),
                ),
              ),
              //* Preferences Title
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 10),
                alignment: Alignment.topLeft,
                child:
                    Text('Preferences', style: MoreMenuStyles.preferencesTitle),
              ),
              //* Preferences Box
              Container(
                margin: EdgeInsets.only(bottom: 50),
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: Color(MoreMenuStyles.accountInfoBoxColor),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  children: [
                    MoreMenuWidgets.preferencesSwitch(
                      title: 'Dark Mode',
                      titleStyle: MoreMenuStyles.preferencesDataTitle,
                      onToggle: (value) => debugPrint(value.toString()),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MoreMenuWidgets.preferencesSwitch(
                      title: 'Notifications',
                      titleStyle: MoreMenuStyles.preferencesDataTitle,
                      onToggle: (value) => debugPrint(value.toString()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
