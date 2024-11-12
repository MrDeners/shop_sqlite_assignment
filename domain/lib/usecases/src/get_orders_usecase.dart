import '../../domain.dart';
import 'usecase.dart';

class GetOrdersUseCase implements FutureUseCase<int, List<OrderModel>> {
  final DataBaseRepository _databaseRepository;

  const GetOrdersUseCase({
    required DataBaseRepository dataBaseRepository,
  }) : _databaseRepository = dataBaseRepository;

  @override
  Future<List<OrderModel>> execute(int userId) async {
    final List<OrderModel> orders = await _databaseRepository.getOrders(userId);

    return orders;
  }
}
