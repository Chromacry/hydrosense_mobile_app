import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/Shared/widgets/shared_widgets.dart';
import 'package:provider/provider.dart';

class TariffRateModal extends StatefulWidget {
  final String tariffRate;
  final String householdId;

  TariffRateModal({
    Key? key,
    required this.tariffRate,
    required this.householdId,
  }) : super(key: key);

  @override
  State<TariffRateModal> createState() => _TariffRateModalState();
}

class _TariffRateModalState extends State<TariffRateModal> {
  final _editDeviceLocationFormKey = GlobalKey<FormState>();
  String? tariffRate;

  void initState() {
    super.initState();
    tariffRate = widget.tariffRate;
  }

  @override
  Widget build(BuildContext context) {
    //* Tariff rate validator
    dynamic tariffRateValidator = (value) {
      if (value == null || value.isEmpty) {
        return 'Tariff rate is empty!';
      }
      return null;
    };

    dynamic onChangedTariffRate = (value) {
      tariffRate = value;
      //* Refresh widget
      setState(() {});
    };

    void onSubmitEditDeviceLocation() {
      if (_editDeviceLocationFormKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully updated Tariff Rate!')),
        );
        Navigator.pop(context);
      }
    }

    return AlertDialog(
      backgroundColor: Color(DesignConstants.COLOR_DARKGRAY_SECONDARY),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Update Tariff Rate',
            style: EditDevicsStyles.editDeviceTitle,
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.white,
            thickness: 1.5,
          ),
        ],
      ),
      content: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Form(
            key: _editDeviceLocationFormKey,
            child: Column(
              children: <Widget>[
                //* Sub Title Information
                Container(
                  padding: EditDevicsStyles.titleContainerPadding,
                  margin: EditDevicsStyles.titleContainerMargin,
                  alignment: EditDevicsStyles.titleAlign,
                  child: const Text(
                    'Information',
                    textAlign: TextAlign.left,
                    style: EditDevicsStyles.addDeviceSubTitle,
                  ),
                ),
                //* Device Name textbox
                InputTextBox(
                  inputTextLabelValue: 'Tariff Rate',
                  inputTextValue: widget.tariffRate,
                  allColorAttributes: Colors.white,
                  onChanged: onChangedTariffRate,
                  validator: tariffRateValidator,
                  obscureTextEnabled: false,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onSubmitEditDeviceLocation,
          child: const Text('Update'),
        ),
      ],
    );
  }
}

class EditDevicsStyles {
  //* Title Text
  static const Alignment titleAlign = Alignment.centerLeft;
  static const EdgeInsets titleContainerMargin = EdgeInsets.only(bottom: 20);
  static const EdgeInsets titleContainerPadding = EdgeInsets.only(top: 20);
  //* Devices Modal title
  static const editDeviceTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  //* Devices Box
  static const devicesBoxColor = DesignConstants.COLOR_DARKGRAY_SECONDARY;

  //* Devices Modal sub title
  static const addDeviceSubTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
