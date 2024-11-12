import 'package:core/core.dart';

import '../domain.dart';

part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String imageUrl,
    @Default(CategoryModel()) CategoryModel category,
  }) = _ProductModel;
}
