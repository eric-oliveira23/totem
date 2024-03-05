import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totem/app/domain/model/item.dart';
import 'package:totem/app/presentation/home/home_provider.dart';

class SelectedItemSheetProvider extends ChangeNotifier {
  final BuildContext context;
  late HomeProvider homeProvider;

  SelectedItemSheetProvider(this.context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
  }

  void doneTapped(Item item) {
    homeProvider.selectedItems.add(item);
    homeProvider.showingOrdersPanel = homeProvider.selectedItems.isNotEmpty;
  }
}
