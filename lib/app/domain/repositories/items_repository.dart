import 'package:totem/app/domain/model/category.dart';

abstract class ItemsRepository {
  Future<List<Category>> fetchAll();
}
