import '../../domain.dart';
import 'usecase.dart';

class GetProductsUseCase implements FutureUseCase<NoParams, List<ProductModel>> {
  final DataBaseRepository _databaseRepository;

  const GetProductsUseCase({
    required DataBaseRepository dataBaseRepository,
  }) : _databaseRepository = dataBaseRepository;

  @override
  Future<List<ProductModel>> execute([NoParams? params]) async {
    final List<ProductModel> products = await _databaseRepository.getProducts();

    return products;
  }
}
