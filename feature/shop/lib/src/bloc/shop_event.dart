part of 'shop_bloc.dart';

abstract class ShopEvent {
  const ShopEvent();
}

class Initialize extends ShopEvent {
  const Initialize();
}

class CreateOrderEvent extends ShopEvent {
  final ProductModel product;

  const CreateOrderEvent(this.product);
}