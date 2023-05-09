abstract class UserAuthTypeAtributes {
  String get userName;
  String get email;
  String get contactNumber;
  String get lastLogin;
  String get createdAt;
  String get updatedAt;
  String get deletedAt;
  String get createdBy;
  String get updatedBy;
  String get deletedBy;
}

class UserAuthType implements UserAuthTypeAtributes{
  @override
  final String userName;
  @override
  final String email;
  @override
  final String contactNumber;
  @override
  final String lastLogin;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String deletedAt;
  @override
  final String createdBy;
  @override
  final String updatedBy;
  @override
  final String deletedBy;

  const UserAuthType({
    required this.userName,
    required this.email,
    required this.contactNumber,
    required this.lastLogin,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedBy,
  });
}