import 'package:domain/models/order_model.dart';

import '../providers/drift/provider/drift_database_provider.dart';
import 'product_model_mapper.dart';

class OrderModelMapper {
  static OrderModel fromData(OrderTableData orderData, ProductTableData productData) {
    return OrderModel(
      id: orderData.id,
      product: ProductModelMapper.fromData(productData),
      amount: orderData.amount,
    );
  }
}