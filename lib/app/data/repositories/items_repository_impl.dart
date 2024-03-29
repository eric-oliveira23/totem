import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:totem/app/data/model/category.dart';
import 'package:totem/app/domain/model/category.dart';
import 'package:totem/app/domain/repositories/items_repository.dart';
import 'package:http/http.dart' as http;

class ItemsRepositoryImpl implements ItemsRepository {
  late final String apiUrl;

  ItemsRepositoryImpl() {
    apiUrl = 'https://${dotenv.env['API_KEY']}.mockapi.io/totem/v1/categories';
  }

  @override
  Future<List<Category>> fetchAll() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        final List<CategoryModel> categories = jsonList
            .map(
              (json) => CategoryModel.fromJson(json),
            )
            .toList();

        List<Category> categoriesConverted =
            categories.map((category) => Category.fromModel(category)).toList();

        return categoriesConverted;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
