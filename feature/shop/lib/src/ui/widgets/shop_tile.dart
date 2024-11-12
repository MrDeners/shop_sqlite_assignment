import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ShopTile extends StatefulWidget {
  final ProductModel product;
  final VoidCallback onAdd;

  const ShopTile({
    required this.product,
    required this.onAdd,
    super.key,
  });

  @override
  State<ShopTile> createState() => _ShopTileState();
}

class _ShopTileState extends State<ShopTile> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 200,
        maxWidth: 300,
      ),
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.contentPadding16),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(AppDimens.mainBorderRadius),
        border: Border.all(color: AppColors.white),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.contentPadding8),
        child: Column(
          children: <Widget>[
            Image.network(
              widget.product.imageUrl,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: AppDimens.contentPadding10),
            Text(widget.product.name, style: context.theme.textTheme.bodyMedium),
            const SizedBox(height: AppDimens.contentPadding8),
            ElevatedButton(
              onPressed: () {
                widget.onAdd();
                setState(() {
                  isVisible = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
                foregroundColor: AppColors.white,
              ),
              child: Text(LocaleKeys.add.watchTr(context)),
            ),
            Visibility(
              visible: isVisible,
              child: Text(LocaleKeys.addSuccess.watchTr(context)),
            ),
          ],
        ),
      ),
    );
  }
}
