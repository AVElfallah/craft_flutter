// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SingupModel {
  String? userName;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? phoneNumber;
  int? governorateId;
  int? id = 1;
  SingupModel({
    this.userName,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.phoneNumber,
    this.governorateId,
    this.id,
  });

  SingupModel copyWith({
    String? userName,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? phoneNumber,
    int? governorateId,
    int? id,
  }) {
    return SingupModel(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      governorateId: governorateId ?? this.governorateId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_name': userName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'phone_number': phoneNumber,
      'governorate_id': governorateId,
      'id': id,
    };
  }

  factory SingupModel.fromMap(Map<String, dynamic> map) {
    return SingupModel(
      userName: map['userName'] != null ? map['userName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      passwordConfirmation: map['passwordConfirmation'] != null
          ? map['passwordConfirmation'] as String
          : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      governorateId:
          map['governorateId'] != null ? map['governorateId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SingupModel.fromJson(String source) =>
      SingupModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SingupModel(userName: $userName, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, phoneNumber: $phoneNumber, governorateId: $governorateId)';
  }

  @override
  bool operator ==(covariant SingupModel other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.email == email &&
        other.password == password &&
        other.passwordConfirmation == passwordConfirmation &&
        other.phoneNumber == phoneNumber &&
        other.governorateId == governorateId;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        passwordConfirmation.hashCode ^
        phoneNumber.hashCode ^
        governorateId.hashCode;
  }
}
