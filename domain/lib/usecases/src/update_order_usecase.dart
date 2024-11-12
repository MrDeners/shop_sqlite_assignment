import '../../domain.dart';
import 'usecase.dart';

class UpdateOrderUseCase implements UseCase<OrderModel, void> {
  final DataBaseRepository _dataBaseRepository;

  const UpdateOrderUseCase({
    required DataBaseRepository dataBaseRepository,
  }) : _dataBaseRepository = dataBaseRepository;

  @override
  Future<void> execute(OrderModel order) {
    return _dataBaseRepository.updateOrder(order);
  }
}
