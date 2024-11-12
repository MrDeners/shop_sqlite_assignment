import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/shop_bloc.dart';
import 'widgets/widgets.dart';

@RoutePage()
class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopBloc>(
      create: (BuildContext context) => ShopBloc(
        createOrderUseCase: appLocator<CreateOrderUseCase>(),
        getProductsUseCase: appLocator<GetProductsUseCase>(),
        getUserDataUseCase: appLocator<GetUserDataUseCase>(),
      )..add(const Initialize()),
      child: const Scaffold(
        body: PageWrapper(
          child: ShopScreenContent(),
        ),
      ),
    );
  }
}
