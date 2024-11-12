import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final GetOrdersUseCase _getOrdersUseCase;
  final UpdateOrderUseCase _updateOrderUseCase;
  final DeleteOrderUseCase _deleteOrderUseCase;

  OrderBloc({
    required GetUserDataUseCase getUserDataUseCase,
    required GetOrdersUseCase getOrdersUseCase,
    required UpdateOrderUseCase updateOrderUseCase,
    required DeleteOrderUseCase deleteOrderUseCase,
  })  : _getUserDataUseCase = getUserDataUseCase,
        _getOrdersUseCase = getOrdersUseCase,
        _updateOrderUseCase = updateOrderUseCase,
        _deleteOrderUseCase = deleteOrderUseCase,
        super(const OrderState()) {
    on<Initialize>(_onInitialize);
    on<IncrementAmountEvent>(_onIncrementAmount);
    on<DecrementAmountEvent>(_onDecrementAmount);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<OrderState> emit,
  ) async {
    final int userId = await _getUserDataUseCase.execute();

    final List<OrderModel> orders = await _getOrdersUseCase.execute(userId);

    emit(
      state.copyWith(orders: orders),
    );
  }

  Future<void> _onIncrementAmount(
    IncrementAmountEvent event,
    Emitter<OrderState> emit,
  ) async {
    final List<OrderModel>? newOrders = state.orders;

    if (newOrders == null) {
      return;
    }

    newOrders[event.index] = newOrders[event.index].copyWith(
      amount: newOrders[event.index].amount + 1,
    );

    await _updateOrderUseCase.execute(newOrders[event.index]);

    emit(
      state.copyWith(
        orders: newOrders,
      ),
    );
  }

  Future<void> _onDecrementAmount(
    DecrementAmountEvent event,
    Emitter<OrderState> emit,
  ) async {
    final List<OrderModel>? newOrders = state.orders;

    if (newOrders == null) {
      return;
    }

    newOrders[event.index] = newOrders[event.index].copyWith(
      amount: newOrders[event.index].amount - 1,
    );

    if (newOrders[event.index].amount == 0) {
      await _deleteOrderUseCase.execute(newOrders[event.index].id);

      newOrders.removeAt(event.index);
    } else {
      await _updateOrderUseCase.execute(newOrders[event.index]);
    }

    emit(
      state.copyWith(
        orders: newOrders,
      ),
    );
  }
}
