import '../../domain.dart';
import 'usecase.dart';

class GetProductsByCategoryUseCase implements FutureUseCase<int, List<ProductModel>> {
  final DataBaseRepository _databaseRepository;

  const GetProductsByCategoryUseCase({
    required DataBaseRepository dataBaseRepository,
  }) : _databaseRepository = dataBaseRepository;

  @override
  Future<List<ProductModel>> execute(int categoryId) async {
    final List<ProductModel> products = await _databaseRepository.getProductsByCategory(categoryId);

    return products;
  }
}
