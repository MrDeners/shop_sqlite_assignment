import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../bloc/order_bloc.dart';
import 'order_tile.dart';

class OrderScreenContent extends StatelessWidget {
  const OrderScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderBloc bloc = context.read<OrderBloc>();

    return BlocBuilder<OrderBloc, OrderState>(
      builder: (BuildContext context, OrderState state) {
        final List<OrderModel>? orders = state.orders;

        if (orders == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (orders.isEmpty) {
          return Center(
            child: Text(
              LocaleKeys.emptyOrderList.watchTr(context),
              style: context.theme.textTheme.titleLarge,
            ),
          );
        } else {
          return ListView.separated(
            itemCount: orders.length,
            itemBuilder: (BuildContext context, int index) => OrderTile(
              order: orders[index],
              onDecrement: () => bloc.add(DecrementAmountEvent(index)),
              onIncrement: () => bloc.add(IncrementAmountEvent(index)),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: AppDimens.contentPadding10),
          );
        }
      },
    );
  }
}
