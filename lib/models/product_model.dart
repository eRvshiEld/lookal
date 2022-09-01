// This is a Dart class,
// not a Flutter widget.
import 'dart:convert';

class ProductModel {
  final String name;
  final String price;
  final String quantity;
  final String unit;
  final String category;
  final String? description;

  ProductModel({
    required this.name,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.category,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'unit': unit,
      'category': category,
      'description': description,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      unit: json['unit'],
      category: json['category'],
      description: json['description'] ?? '',
    );
  }
}
