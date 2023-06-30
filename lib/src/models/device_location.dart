class DeviceLocation {
  String? id; //* Device Locaiton UUID
  String? device_location_name;
  String? household_id;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? created_by;
  String? updated_by;
  String? deleted_by;

  DeviceLocation({
    this.id,
    this.device_location_name,
    this.household_id,
    this.created_at,
    this.updated_at,
    this.deleted_at,
    this.created_by,
    this.updated_by,
    this.deleted_by,
  });
}
