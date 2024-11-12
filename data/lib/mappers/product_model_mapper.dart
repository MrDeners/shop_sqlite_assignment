import 'package:domain/domain.dart';

import '../providers/drift/provider/drift_database_provider.dart';

class ProductModelMapper {
  static ProductModel fromData(ProductTableData productData) {
    return ProductModel(
      id: productData.id,
      name: productData.name,
      imageUrl: productData.imageUrl,
    );
  }
}
