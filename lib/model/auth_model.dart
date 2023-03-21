import 'dart:convert';

import 'client_model.dart';

class AuthModel {
  String? token;
  ClientModel? client;
  AuthModel({
    this.token,
    this.client,
  });

  AuthModel copyWith({
    String? token,
    ClientModel? client,
  }) {
    return AuthModel(
      token: token ?? this.token,
      client: client ?? this.client,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'client': client?.toMap(),
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      token: map['token'] != null ? map['token'] as String : null,
      client: map['client'] != null
          ? ClientModel.fromMap(
              map['client'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthModel(token: $token, client: $client)';

  @override
  bool operator ==(covariant AuthModel other) {
    if (identical(this, other)) return true;

    return other.token == token && other.client == client;
  }

  @override
  int get hashCode => token.hashCode ^ client.hashCode;
}
