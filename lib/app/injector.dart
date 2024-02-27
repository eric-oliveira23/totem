import 'package:get_it/get_it.dart';
import 'package:totem/app/data/repositories/items_repository_impl.dart';
import 'package:totem/app/domain/repositories/items_repository.dart';
import 'package:totem/app/domain/usecases/fetch_categories.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ItemsRepository>(() => ItemsRepositoryImpl());
  getIt.registerLazySingleton(
      () => FetchCategories(itemsRepository: ItemsRepositoryImpl()));
}
