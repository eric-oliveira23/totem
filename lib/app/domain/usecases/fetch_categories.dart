import 'package:totem/app/domain/model/category.dart';
import 'package:totem/app/domain/repositories/items_repository.dart';

class FetchCategories {
  final ItemsRepository itemsRepository;

  FetchCategories({required this.itemsRepository});

  Future<List<Category>> call() {
    return itemsRepository.fetchAll();
  }
}
