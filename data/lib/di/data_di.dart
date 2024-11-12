import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../providers/drift/drift.dart';
import '../repositories/database_repository_impl.dart';
import '../repositories/user_data_repository_impl.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initConfiguration();
    _initProviders();
    _initRepositories();
    _initUseCases();
  }

  void _initConfiguration() {}

  void _initProviders() {
    appLocator.registerLazySingleton<AppDatabase>(AppDatabase.new);
  }

  void _initRepositories() {
    appLocator.registerLazySingleton<DataBaseRepository>(
      () => DataBaseRepositoryImpl(
        dbProvider: appLocator<AppDatabase>(),
      ),
    );

    appLocator.registerLazySingleton<UserDataRepository>(UserDataRepositoryImpl.new);
  }

  void _initUseCases() {
    appLocator.registerLazySingleton<GetUserDataUseCase>(
      () => GetUserDataUseCase(
        userDataRepository: appLocator<UserDataRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GetCategoriesUseCase>(
      () => GetCategoriesUseCase(
        dataBaseRepository: appLocator<DataBaseRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GetProductsUseCase>(
      () => GetProductsUseCase(
        dataBaseRepository: appLocator<DataBaseRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GetProductsByCategoryUseCase>(
      () => GetProductsByCategoryUseCase(
        dataBaseRepository: appLocator<DataBaseRepository>(),
      ),
    );

    appLocator.registerLazySingleton<CreateOrderUseCase>(
      () => CreateOrderUseCase(
        dataBaseRepository: appLocator<DataBaseRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GetOrdersUseCase>(
      () => GetOrdersUseCase(
        dataBaseRepository: appLocator<DataBaseRepository>(),
      ),
    );

    appLocator.registerLazySingleton<UpdateOrderUseCase>(
          () => UpdateOrderUseCase(
        dataBaseRepository: appLocator<DataBaseRepository>(),
      ),
    );

    appLocator.registerLazySingleton<DeleteOrderUseCase>(
          () => DeleteOrderUseCase(
        dataBaseRepository: appLocator<DataBaseRepository>(),
      ),
    );
  }
}
