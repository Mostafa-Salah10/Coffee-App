import 'package:coffee_app/core/enums/coffee_size_enum.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CoffeeModel extends Equatable {
  final String categoryName;
  final String description;
  final String imagePath;
  final List<CoffeeSize> coffeeSize;
  final double rate;
  final double volume;
  final double price;
  int quantity;

  CoffeeModel({
    required this.imagePath,
    required this.categoryName,
    required this.description,
    required this.coffeeSize,
    required this.rate,
    required this.volume,
    required this.price,
    required this.quantity,
  });

  CoffeeModel copyWith({
    String? categoryName,
    String? description,
    String? imagePath,
    List<CoffeeSize>? coffeeSize,
    double? rate,
    double? volume,
    double? price,
    int? quantity,
  }) => CoffeeModel(
    imagePath: imagePath ?? this.imagePath,
    categoryName: categoryName ?? this.categoryName,
    description: description ?? this.description,
    coffeeSize: coffeeSize ?? this.coffeeSize,
    rate: rate ?? this.rate,
    volume: volume ?? this.volume,
    price: price ?? this.price,
    quantity: quantity ?? this.quantity,
  );

  @override
  List<Object?> get props => [
    imagePath,
    categoryName,
    description,
    coffeeSize,
    rate,
    volume,
    price,
    quantity,
  ];
}
