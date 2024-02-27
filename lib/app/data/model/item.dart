import 'dart:convert';

class ItemModel {
  final String id;
  final String title;
  final String image;
  final int price;

  ItemModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  ItemModel copyWith({
    String? id,
    String? title,
    String? image,
    int? price,
  }) {
    return ItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'price': price,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      price: map['price'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, title: $title, image: $image, price: $price)';
  }

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.image == image &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ image.hashCode ^ price.hashCode;
  }
}
