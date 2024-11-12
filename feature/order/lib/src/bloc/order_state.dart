part of 'order_bloc.dart';

class OrderState {
  final List<OrderModel>? orders;

  const OrderState({
    this.orders,
  });

  OrderState copyWith({
    List<OrderModel>? orders,
  }) {
    return OrderState(
      orders: orders ?? this.orders,
    );
  }
}
