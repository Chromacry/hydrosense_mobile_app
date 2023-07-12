import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';

class Device {
  String? id; //* Device UUID
  String? device_name;
  String? device_household_id;
  String? device_location_id;
  String? device_serialnumber;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? created_by;
  String? updated_by;
  String? deleted_by;

  Device({
    this.id,
    this.device_name,
    this.device_serialnumber,
    this.device_household_id,
    this.device_location_id,
    this.created_at,
    this.updated_at,
    this.deleted_at,
    this.created_by,
    this.updated_by,
    this.deleted_by,
  });

  Device.fromMap(Map<String, dynamic> snapshot, String id)
      : id = id,
        device_name = snapshot['device_name'] ?? '',
        device_serialnumber = snapshot['device_serialnumber'] ?? '',
        device_household_id =
            double.parse(snapshot['household_id'].toString()).toString(),
        created_at =
            (snapshot['created_at'] ?? DateTimeUtil.getCurrentDateTime());
}
