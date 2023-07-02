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
}
