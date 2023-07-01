import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/UpdateInfo/view/update_info_view.dart';

class UpdateInfo extends StatelessWidget {
  const UpdateInfo({super.key,});
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Update Info',
          ),
        ),
        backgroundColor: const Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(DesignConstants.COLOR_DARKBLUE_PRIMARY),
      body: const UpdateInfoView(),
    );
  }
}
