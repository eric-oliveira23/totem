import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:totem/app/domain/model/category.dart';
import 'package:totem/app/domain/model/item.dart';
import 'package:totem/app/domain/usecases/fetch_categories.dart';
import 'package:totem/app/presentation/select_item_sheet/select_item_sheet.dart';

class HomeProvider extends ChangeNotifier {
  bool _showingOrdersPanel = false;

  bool get showingOrdersPanel => _showingOrdersPanel;
  set showingOrdersPanel(bool value) {
    _showingOrdersPanel = value;
    notifyListeners();
  }

  final List<Item> _selectedItems = [];
  List<Item> get selectedItems => _selectedItems;
  set selectedItems(List<Item>? list) {
    selectedItems = list;
    notifyListeners();
  }

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  Category? _selectedCategory;
  Category? get selectedCategory => _selectedCategory;

  bool _doPlayListOpacityAnim = false;
  bool get doPlayListOpacityAnim => _doPlayListOpacityAnim;

  final ScrollController _itemsScrollController = ScrollController();
  ScrollController get itemsScrollController => _itemsScrollController;

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

  void itemClicked(BuildContext context, Item item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return SelectItemSheet(
          selectedItem: item,
        );
      },
    );
  }

  _playOpacityAnimation(Function func) {
    _doPlayListOpacityAnim = false;
    notifyListeners();

    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        func();
        _doPlayListOpacityAnim = true;
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
