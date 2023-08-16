import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydrosense_mobile_app/src/models/device.dart';

class DevicesFirestore {
  addDevice(purpose, mode, cost, travelDate) {
    return FirebaseFirestore.instance.collection('devices').add({
      'id': purpose,
      'mode': mode,
      'cost': cost,
      'travelDate': travelDate
    });
  }

  removeDevice(id) {
    return FirebaseFirestore.instance.collection('expenses').doc(id).delete();
  }

  Stream<List<Device>> getDevices() {
    return FirebaseFirestore.instance.collection('expenses').snapshots().map(
        (snapshot) => snapshot.docs
            .map<Device>((doc) => Device.fromMap(doc.data(), doc.id))
            .toList());
  }

  editExpense(id, purpose, mode, cost, travelDate) {
    return FirebaseFirestore.instance.collection('expenses').doc(id).update({
      'purpose': purpose,
      'mode': mode,
      'cost': cost,
      'travelDate': travelDate
    });
  }
}
