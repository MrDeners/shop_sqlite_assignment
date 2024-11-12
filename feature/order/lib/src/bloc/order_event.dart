part of 'order_bloc.dart';

abstract class OrderEvent {
  const OrderEvent();
}

class Initialize extends OrderEvent {
  const Initialize();
}

class IncrementAmountEvent extends OrderEvent {
  final int index;

  const IncrementAmountEvent(this.index);
}

class DecrementAmountEvent extends OrderEvent {
  final int index;

  const DecrementAmountEvent(this.index);
}
