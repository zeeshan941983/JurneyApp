class UserModel {
  String username;
  String email;
  String? avatar;
  String? role;
  String? address;
  String? emailVerifiedAt;
  String? phoneNumber;
  String? governmentId;
  String? emergencyContact;

  UserModel({
    required this.username,
    required this.email,
    this.avatar,
    this.role,
    this.address,
    this.emailVerifiedAt,
    this.phoneNumber,
    this.governmentId,
    this.emergencyContact,
  });

  UserModel.empty()
      : username = '',
        email = '',
        avatar = null,
        role = null,
        address = null,
        emailVerifiedAt = null,
        phoneNumber = null,
        governmentId = null,
        emergencyContact = null;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      avatar: json['avatar'],
      role: json['role'],
      address: json['address'],
      emailVerifiedAt: json['emailVerifiedAt'],
      phoneNumber: json['phoneNumber'],
      governmentId: json['governmentId'],
      emergencyContact: json['emergencyContact'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'avatar': avatar,
      'role': role,
      'address': address,
      'emailVerifiedAt': emailVerifiedAt,
      'phoneNumber': phoneNumber,
      'governmentId': governmentId,
      'emergencyContact': emergencyContact,
    };
  }

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, avatar: $avatar, role: $role, address: $address, emailVerifiedAt: $emailVerifiedAt, phoneNumber: $phoneNumber, governmentId: $governmentId, emergencyContact: $emergencyContact)';
  }
}
