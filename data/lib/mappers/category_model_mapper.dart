import 'package:domain/domain.dart';

import '../providers/drift/provider/drift_database_provider.dart';

class CategoryModelMapper {
  static CategoryModel fromData(CategoryTableData categoryData) {
    return CategoryModel(
      id: categoryData.id,
      name: categoryData.name,
      description: categoryData.description,
    );
  }
}
