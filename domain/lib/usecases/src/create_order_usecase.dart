import '../../domain.dart';
import 'usecase.dart';

class CreateOrderUseCase implements UseCase<CreateOrderPayload, void> {
  final DataBaseRepository _dataBaseRepository;

  const CreateOrderUseCase({
    required DataBaseRepository dataBaseRepository,
  }) : _dataBaseRepository = dataBaseRepository;

  @override
  Future<void> execute(CreateOrderPayload order) {
    return _dataBaseRepository.insertOrder(
      order.order,
      order.userId,
    );
  }
}

class CreateOrderPayload {
  final OrderModel order;
  final int userId;

  const CreateOrderPayload({
    required this.order,
    required this.userId,
  });
}
