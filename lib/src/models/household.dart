class Household {
  String? id; //* Household UUID
  String? household_name;
  String? household_tariff_rate;
  String? household_address;
  String? household_postalcode;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? created_by;
  String? updated_by;
  String? deleted_by;

  Household({
    this.id,
    this.household_name,
    this.household_tariff_rate,
    this.household_address,
    this.household_postalcode,
    this.created_at,
    this.updated_at,
    this.deleted_at,
    this.created_by,
    this.updated_by,
    this.deleted_by,
  });
}
