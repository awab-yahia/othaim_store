import 'package:equatable/equatable.dart';
import 'package:othaim_store/features/product/domain/entities/product.dart';

class ProductModel extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? category;
  final String? description;
  final String? image;

  const ProductModel({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
  });

  @override
  List<Object?> get props => [id, title, price, category, description, image];

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
    };
  }

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      price: price,
      category: category,
      description: description,
      image: image,
    );
  }

  factory ProductModel.fromEntity(Product entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      price: entity.price,
      category: entity.category,
      description: entity.description,
      image: entity.image,
    );
  }
}
