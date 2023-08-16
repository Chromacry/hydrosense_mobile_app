import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';

class WaterLog {
  String? id; //* Device UUID
  String? device_id;
  String? time_used;
  String? flow_rate;
  String? water_usage;
  String? created_at;
  String? deleted_at;

  WaterLog({
    this.id,
    this.device_id,
    this.time_used,
    this.flow_rate,
    this.water_usage,
    this.created_at,
    this.deleted_at,
  });

  WaterLog.fromMap(Map<String, dynamic> snapshot, String id)
      : id = id,
        device_id = snapshot['device_id'] ?? '',
        time_used = snapshot['time_used'] ?? '',
        flow_rate = snapshot['flow_rate'].toString(),
        water_usage = snapshot['water_usage'].toString(),
        created_at =
            (snapshot['created_at'] ?? DateTimeUtil.getCurrentDateTime()),
        deleted_at =
            (snapshot['created_at'] ?? DateTimeUtil.getCurrentDateTime());
}
