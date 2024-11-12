part of 'shop_bloc.dart';

class ShopState {
  final int? userId;
  final List<ProductModel>? products;

  const ShopState({
    this.products,
    this.userId,
  });

  ShopState copyWith({
    List<ProductModel>? products,
    int? userId,
  }) {
    return ShopState(
      userId: userId ?? this.userId,
      products: products ?? this.products,
    );
  }
}
