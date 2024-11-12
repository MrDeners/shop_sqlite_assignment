import '../../domain.dart';
import 'usecase.dart';

class DeleteOrderUseCase implements UseCase<int, void> {
  final DataBaseRepository _dataBaseRepository;

  const DeleteOrderUseCase({
    required DataBaseRepository dataBaseRepository,
  }) : _dataBaseRepository = dataBaseRepository;

  @override
  Future<void> execute(int orderId) {
    return _dataBaseRepository.deleteOrder(orderId);
  }
}
