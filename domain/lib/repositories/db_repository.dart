import '../domain.dart';

abstract class DataBaseRepository {
  Future<void> insertOrder(OrderModel data, int userId);

  Future<List<OrderModel>> getOrders(int userId);

  Future<List<CategoryModel>> getCategories();

  Future<List<ProductModel>> getProducts();

  Future<List<ProductModel>> getProductsByCategory(int categoryId);

  Future<void> deleteOrder(int orderId);

  Future<void> updateOrder(OrderModel data);

}
