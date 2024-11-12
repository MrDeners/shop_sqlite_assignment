import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const OrderTile({
    required this.order,
    required this.onDecrement,
    required this.onIncrement,
    super.key,
  });

  static const double titleHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: titleHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.contentPadding12,
        vertical: AppDimens.contentPadding16,
      ),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(AppDimens.mainBorderRadius),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Image.network(
            order.product.imageUrl,
            width: 100,
            height: 100,
          ),
          const SizedBox(width: AppDimens.contentPadding16),
          Text(
            order.product.name,
            style: context.theme.textTheme.titleLarge?.copyWith(color: AppColors.white),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: AppColors.white,
            ),
            onPressed: onDecrement,
          ),
          Text(
            order.amount.toString(),
            style: context.theme.textTheme.titleMedium,
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
            onPressed: onIncrement,
          ),
        ],
      ),
    );
  }
}
