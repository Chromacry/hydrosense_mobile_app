import 'package:hydrosense_mobile_app/src/utils/DateTimeUtil.dart';

class User {
  String? id;
  String? username;
  String? password;
  String? email_address;
  String? phone_number;
  String? role_id;
  String? household_id;
  String? user_status;
  String? last_login;
  String? profile_photo;
  String? profile_banner;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? created_by;
  String? updated_by;
  String? deleted_by;

  User({
    this.id,
    this.username,
    this.password,
    this.email_address,
    this.phone_number,
    this.role_id,
    this.household_id,
    this.user_status,
    this.last_login,
    this.profile_photo,
    this.profile_banner,
    this.created_at,
    this.updated_at,
    this.deleted_at,
    this.created_by,
    this.updated_by,
    this.deleted_by,
  });

  User.fromMap(Map<String, dynamic> snapshot, String id): 
  id = snapshot['id'] ?? '',
  username = snapshot['username'] ?? '',
  email_address = snapshot['email_address'] ?? '',
  phone_number = snapshot['phone_number'].toString(),
  role_id = snapshot['role_id'].toString(),
  household_id = snapshot['household_id'].toString(),
  profile_banner = snapshot['profile_banner'].toString(),
  profile_photo = snapshot['profile_photo'].toString(),
  last_login = snapshot['last_login'].toString(),
  user_status = snapshot['user_status'].toString(),
  created_at =
      (snapshot['created_at'] ?? DateTimeUtil.getCurrentDateTime());
}
