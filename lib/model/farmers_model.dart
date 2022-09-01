// This is a Dart class,
// not a Flutter widget.
import 'dart:convert';

class FarmersModel {
  final String address;
  final String email;
  final String name;

  FarmersModel(
    this.address,
    this.email,
    this.name,
  );

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'email': email,
      'name': name,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  // factory FarmersModel.fromJson(Map<String, dynamic> json) {
  //   return FarmersModel(
  //     address: json['address'],
  //     email: json['email'] ?? '',
  //     name: json['name'] ?? '',
  //   );
  // }
}
