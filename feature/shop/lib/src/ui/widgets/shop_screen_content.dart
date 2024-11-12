import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../bloc/shop_bloc.dart';
import 'shop_tile.dart';

class ShopScreenContent extends StatelessWidget {
  const ShopScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ShopBloc bloc = context.read<ShopBloc>();

    return BlocBuilder<ShopBloc, ShopState>(
      builder: (BuildContext context, ShopState state) {
        final List<ProductModel> products = state.products ?? <ProductModel>[];

        return Padding(
          padding: const EdgeInsets.only(top: AppDimens.contentPadding16),
          child: GroupedListView<ProductModel, int>(
            order: GroupedListOrder.DESC,
            padding: EdgeInsets.zero,
            elements: products.reversed.toList(),
            groupBy: (ProductModel element) => element.category.id,
            separator: const SizedBox(height: AppDimens.contentPadding16),
            groupHeaderBuilder: (ProductModel element) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppDimens.contentPadding16,
                      bottom: AppDimens.contentPadding16,
                    ),
                    child: Text(
                      element.category.name,
                      style: context.theme.textTheme.labelLarge?.copyWith(fontSize: 15),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: AppDimens.contentPadding16),
                ],
              );
            },
            indexedItemBuilder: (_, ProductModel element, int index) {
              return ShopTile(
                product: element,
                onAdd: () => bloc.add(CreateOrderEvent(element)),
              );
            },
          ),
        );
      },
    );
  }
}
