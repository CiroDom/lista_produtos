import 'package:carrinho_compras_app/main.dart';
import 'package:flutter/material.dart';

import '../../res/strings.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              Strings.wishlistTitle,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Total: ${wishListController.totalPrice}'),
            const SizedBox(
              height: 8,
            ),
            ListView.builder(
              itemCount: wishListController.products.length,
              shrinkWrap:
                  true, //necesário pois o Column não restringe/determina altura do ListV
              itemBuilder: (context, index) {
                final product = wishListController.products[index];

                return ListTile(
                  title: Text(product.name),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
