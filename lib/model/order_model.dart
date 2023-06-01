class Order {
  final String? firstName;
  final String? lastName;
  final String? companyName;
  final int? governorateId;
  final String? address;
  final String? city;
  final String? countryState;
  final String? postCode;
  final String? phone;
  final String? notes;
  final String? email;

  Order({
    this.firstName,
    this.lastName,
    this.companyName,
    this.governorateId,
    this.address,
    this.city,
    this.countryState,
    this.postCode,
    this.phone,
    this.notes,
    this.email,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      companyName: json['company_name'] as String?,
      governorateId: json['governorate_id'] as int?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      countryState: json['country_state'] as String?,
      postCode: json['post_code'] as String?,
      phone: json['phone'] as String?,
      notes: json['notes'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'first_name': firstName,
      'last_name': lastName,
      'company_name': companyName,
      'governorate_id': governorateId ?? 1,
      'address': address,
      'city': city,
      'country_state': countryState,
      'post_code': postCode,
      'phone': phone,
      'notes': notes,
      'email': email,
    };
    return data;
  }
}
