import 'package:core/core.dart';

part 'category_model.freezed.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String description,
  }) = _CategoryModel;

  const CategoryModel._();
}
