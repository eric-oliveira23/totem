import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:totem/app/domain/model/category.dart';
import 'package:totem/app/domain/usecases/fetch_categories.dart';

class HomeProvider extends ChangeNotifier {
  bool _showingOrdersPanel = false;

  bool get showingOrdersPanel => _showingOrdersPanel;
  set showingOrdersPanel(bool value) {
    _showingOrdersPanel = value;
    notifyListeners();
  }

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  Category? _selectedCategory;
  Category? get selectedCategory => _selectedCategory;

  bool _doPlayOpacityAnim = false;
  bool get doPlayOpacityAnim => _doPlayOpacityAnim;

  final ScrollController _itemsScrollController = ScrollController();
  ScrollController get itemsScrollController => _itemsScrollController;

  // usecase
  late final FetchCategories fetchCategories;

  HomeProvider() : fetchCategories = GetIt.instance<FetchCategories>();

  Future<void> loadData() async {
    try {
      _categories = await fetchCategories.call();
      notifyListeners();
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  void categoryClicked(Category category) {
    if (category == _selectedCategory) {
      return;
    }

    _playOpacityAnimation(() => _selectedCategory = category);
    _scrollDown();
  }

  _playOpacityAnimation(Function func) {
    _doPlayOpacityAnim = false;
    notifyListeners();

    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        func();
        _doPlayOpacityAnim = true;
        notifyListeners();
      },
    );
  }

  void _scrollDown() {
    _itemsScrollController.animateTo(
      _itemsScrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}
