import '../../domain.dart';
import 'usecase.dart';

class GetCategoriesUseCase implements FutureUseCase<NoParams, List<CategoryModel>> {
  final DataBaseRepository _databaseRepository;

  const GetCategoriesUseCase({
    required DataBaseRepository dataBaseRepository,
  }) : _databaseRepository = dataBaseRepository;

  @override
  Future<List<CategoryModel>> execute([NoParams? params]) async {
    final List<CategoryModel> categories = await _databaseRepository.getCategories();

    return categories;
  }
}
