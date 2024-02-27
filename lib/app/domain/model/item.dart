import 'package:totem/app/data/model/category.dart';

class Item {
  final String? id;
  final String? title;
  final String? image;
  final int? price;

  Item({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  factory Item.fromModel(ItemModel itemModel) {
    return Item(
        id: itemModel.id,
        image: itemModel.image,
        price: itemModel.price,
        title: itemModel.title);
  }
}
