import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_event.dart';

part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final CreateOrderUseCase _createOrderUseCase;
  final GetProductsUseCase _getProductsUseCase;
  final GetUserDataUseCase _getUserDataUseCase;

  ShopBloc({
    required CreateOrderUseCase createOrderUseCase,
    required GetProductsUseCase getProductsUseCase,
    required GetUserDataUseCase getUserDataUseCase,
  })  : _createOrderUseCase = createOrderUseCase,
        _getProductsUseCase = getProductsUseCase,
        _getUserDataUseCase = getUserDataUseCase,
        super(const ShopState()) {
    on<Initialize>(_onInitialize);
    on<CreateOrderEvent>(_onCreateOrder);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<ShopState> emit,
  ) async {
    final int userId = await _getUserDataUseCase.execute();
    final List<ProductModel> products = await _getProductsUseCase.execute();

    emit(
      state.copyWith(
        products: products,
        userId: userId,
      ),
    );
  }

  Future<void> _onCreateOrder(
    CreateOrderEvent event,
    Emitter<ShopState> emit,
  ) async {
    final List<ProductModel>? products = state.products;
    final int? userId = state.userId;

    if (products == null || userId == null) {
      return;
    }

    await _createOrderUseCase.execute(
      CreateOrderPayload(
        order: OrderModel(product: event.product),
        userId: userId,
      ),
    );
  }
}
