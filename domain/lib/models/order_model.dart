import 'package:core/core.dart';

import 'product_model.dart';

part 'order_model.freezed.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @Default(0) int id,
    @Default(ProductModel()) ProductModel product,
    @Default(1) int amount,
  }) = _OrderModel;

  const OrderModel._();
}
