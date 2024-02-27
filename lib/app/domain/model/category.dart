import 'package:totem/app/data/model/category.dart';
import 'package:totem/app/domain/model/item.dart';

class Category {
  String? id;
  String? title;
  String? image;
  List<Item>? items;

  Category({
    this.id,
    this.title,
    this.image,
    this.items,
  });

  factory Category.fromModel(CategoryModel model) {
    List<Item> convertedItems =
        model.items?.map((itemModel) => Item.fromModel(itemModel)).toList() ??
            [];

    return Category(
      id: model.id,
      image: model.image,
      items: convertedItems,
      title: model.title,
    );
  }
}
