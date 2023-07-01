import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/global_constants.dart';
import 'package:hydrosense_mobile_app/src/models/household.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class HouseholdsDB with ChangeNotifier {
  //* Data list
  List<Household> households = [
    Household(
      id: 'dwadwawadwdadwadwa',
      household_name: 'Kitchen',
      household_postalcode: '533333',
      household_address: 'Block 223, Tampines street 23',
      household_tariff_rate: '4.5',
      created_by: 'System',
      created_at: 'Now',
    ),
  ];

  List<Household> getAllHouseholds() {
    return households;
  }

  List<Household> getAllHouseholdsByHouseholdId({householdId}) {
    List<Household> householdHouseholds = [];
    for (Household currentHousehold in households) {
      if (currentHousehold.id == householdId)
        householdHouseholds.add(currentHousehold);
    }
    return householdHouseholds;
  }

  Household getHouseholdById({HouseholdId}) {
    Household deviceData = Household(id: HouseholdId);
    for (Household currentDevice in households) {
      if (currentDevice.id == HouseholdId) deviceData = currentDevice;
    }
    return deviceData;
  }

  void addHousehold(
      {HouseholdName, householdPostalCode, createdBy, createdAt}) {
    Household HouseholdData = Household(
      id: uuid.v4(),
      household_name: HouseholdName,
      household_postalcode: householdPostalCode,
      created_at: createdAt,
      created_by: createdBy ?? 'system',
    );
    households.add(HouseholdData);
    notifyListeners();
  }

  void updateHouseholdById({
    householdId,
    householdName,
    householdTariffRate,
    updatedBy,
    updatedAt,
  }) {
    int HouseholdIndex =
        households.indexWhere((element) => element.id == householdId);
    if (HouseholdIndex != -1) {
      Household currentHousehold = households[HouseholdIndex];
      currentHousehold.household_name = householdName;
      currentHousehold.household_tariff_rate = householdTariffRate;
      currentHousehold.updated_by = updatedBy;
      currentHousehold.updated_at = updatedAt;
      notifyListeners();
    }
  }

  void deleteHouseholdById({
    HouseholdId,
    HouseholdName,
    householdId,
    deletedBy,
    deletedAt,
  }) {
    int HouseholdIndex =
        households.indexWhere((element) => element.id == HouseholdId);
    households[HouseholdIndex] = Household(
      deleted_by: deletedBy,
      deleted_at: deletedAt,
    );
    notifyListeners();
  }

  void removeHouseholdById(HouseholdId) {
    households.removeAt(
        households.indexWhere((element) => element.id == HouseholdId));
    notifyListeners();
  }
}
