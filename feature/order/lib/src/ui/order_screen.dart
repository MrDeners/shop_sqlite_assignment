import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/order_bloc.dart';
import 'widgets/widgets.dart';

@RoutePage()
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderBloc>(
      lazy: false,
      create: (BuildContext context) => OrderBloc(
        getUserDataUseCase: appLocator<GetUserDataUseCase>(),
        getOrdersUseCase: appLocator<GetOrdersUseCase>(),
        updateOrderUseCase: appLocator<UpdateOrderUseCase>(),
        deleteOrderUseCase: appLocator<DeleteOrderUseCase>(),
      )..add(const Initialize()),
      child: const Scaffold(
        body: PageWrapper(
          child: OrderScreenContent(),
        ),
      ),
    );
  }
}
