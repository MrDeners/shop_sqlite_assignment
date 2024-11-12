import 'package:domain/domain.dart';
import 'package:drift/drift.dart';

import '../mappers/category_model_mapper.dart';
import '../mappers/order_model_mapper.dart';
import '../mappers/product_model_mapper.dart';
import '../providers/drift/drift.dart';
import '../providers/drift/provider/drift_database_provider.dart';

class DataBaseRepositoryImpl implements DataBaseRepository {
  final AppDatabase _dbProvider;

  const DataBaseRepositoryImpl({
    required AppDatabase dbProvider,
  }) : _dbProvider = dbProvider;

  @override
  Future<void> insertOrder(OrderModel data, int userId) async {
    final OrderTableCompanion orderCompanion = OrderTableCompanion.insert(
      userId: userId,
      productId: data.product.id,
      amount: data.amount,
    );

    final OrderTableData? order = await (_dbProvider.select(_dbProvider.orderTable)
          ..where(($OrderTableTable e) => e.productId.equals(data.product.id)))
        .getSingleOrNull();

    if (order != null) {
      final OrderTableCompanion newOrderCompanion = OrderTableCompanion(
        id: Value<int>(order.id),
        productId: Value<int>(order.productId),
        amount: Value<int>(order.amount + 1),
      );

      await (_dbProvider.update(_dbProvider.orderTable)
            ..where(
              ($OrderTableTable tbl) => tbl.id.equals(order.id),
            ))
          .write(newOrderCompanion);
      return;
    }

    await _dbProvider.into(_dbProvider.orderTable).insert(orderCompanion);
  }

  @override
  Future<List<OrderModel>> getOrders(int userId) async {
    final List<OrderTableData> orders = await _dbProvider.select(_dbProvider.orderTable).get()
      ..where((OrderTableData result) => result.userId == userId);

    final List<OrderModel> orderModels = <OrderModel>[];

    for (final OrderTableData e in orders) {
      final ProductTableData? product = await (_dbProvider.select(_dbProvider.productTable)
            ..where(
              ($ProductTableTable tbl) => tbl.id.equals(e.productId),
            ))
          .getSingleOrNull();

      if (product == null) {
        continue;
      }

      orderModels.add(OrderModelMapper.fromData(e, product));
    }

    return orderModels;
  }

  @override
  Future<void> updateOrder(OrderModel data) async {
    await (_dbProvider.update(_dbProvider.orderTable)
          ..where(
            ($OrderTableTable tbl) => tbl.id.equals(data.id),
          ))
        .write(
      OrderTableCompanion(
        amount: Value<int>(data.amount),
      ),
    );
  }

  @override
  Future<void> deleteOrder(int orderId) async {
    await (_dbProvider.delete(_dbProvider.orderTable)
          ..where(
            ($OrderTableTable tbl) => tbl.id.equals(orderId),
          ))
        .go();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final List<CategoryTableData> categories =
        await _dbProvider.select(_dbProvider.categoryTable).get();

    final List<CategoryModel> categoryModels =
        categories.map(CategoryModelMapper.fromData).toList();

    return categoryModels;
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final List<ProductTableData> products =
        await _dbProvider.select(_dbProvider.productTable).get();

    final List<ProductModel> productModels = <ProductModel>[];

    for (final ProductTableData product in products) {
      final List<int> categoryIds = await (_dbProvider.select(_dbProvider.categoryProductLinksTable)
            ..where(($CategoryProductLinksTableTable tbl) => tbl.productId.equals(product.id)))
          .map((CategoryProductLinksTableData row) => row.categoryId)
          .get();

      CategoryModel? categoryModel;

      if (categoryIds.isNotEmpty) {
        final CategoryTableData? category = await (_dbProvider.select(_dbProvider.categoryTable)
              ..where(($CategoryTableTable tbl) => tbl.id.equals(categoryIds.first)))
            .getSingleOrNull();

        if (category == null) {
          continue;
        }

        categoryModel = CategoryModel(
          id: category.id,
          name: category.name,
          description: category.description,
        );
      }

      final ProductModel productModel = ProductModel(
        id: product.id,
        name: product.name,
        imageUrl: product.imageUrl,
        category: categoryModel ?? const CategoryModel(),
      );

      productModels.add(productModel);
    }

    return productModels;
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    final List<int> productIds = await (_dbProvider.select(_dbProvider.categoryProductLinksTable)
          ..where(($CategoryProductLinksTableTable tbl) => tbl.categoryId.equals(categoryId)))
        .get()
        .then(
          (List<CategoryProductLinksTableData> rows) =>
              rows.map((CategoryProductLinksTableData row) => row.productId).toList(),
        );

    final List<ProductTableData> products = await _dbProvider.select(_dbProvider.productTable).get()
      ..where((ProductTableData element) => productIds.contains(element.id));

    final List<ProductModel> productModels = products.map(ProductModelMapper.fromData).toList();

    return productModels;
  }
}
