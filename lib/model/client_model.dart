// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClientModel {
  int? id;
  String? userName;
  String? email;
  String? pincode;
  bool? status;
  int? governorateID;
  DateTime? createdAt;
  DateTime? updatedAt;
  ClientModel({
    this.id,
    this.userName,
    this.email,
    this.pincode,
    this.status,
    this.governorateID,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_name': userName,
      'email': email,
      'pin_code': pincode,
      'status': status,
      'governorate_id': governorateID,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    var govid = map['governorate_id'].runtimeType == String
        ? int.parse(map['governorate_id'])
        : map['governorate_id'];
    return ClientModel(
      id: map['id'] ?? 0,
      userName: map['user_name'] != null ? map['user_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      pincode: map['pin_code'] != null ? map['pin_code'] as String : null,
      status: map['status'] != null ? map['status'] == 1 : null,
      governorateID: govid,
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ClientModel copyWith({
    int? id,
    String? userName,
    String? email,
    String? pincode,
    bool? status,
    int? governorateID,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ClientModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      pincode: pincode ?? this.pincode,
      status: status ?? this.status,
      governorateID: governorateID ?? this.governorateID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(covariant ClientModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userName == userName &&
        other.email == email &&
        other.pincode == pincode &&
        other.status == status &&
        other.governorateID == governorateID &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userName.hashCode ^
        email.hashCode ^
        pincode.hashCode ^
        status.hashCode ^
        governorateID.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
