import 'package:carrinho_compras_app/app_widget/views/wish_list_view.dart';
import 'package:carrinho_compras_app/main.dart';
import 'package:carrinho_compras_app/product/product.dart';
import 'package:carrinho_compras_app/product/product_repo.dart';
import 'package:flutter/material.dart';
import '../../res/strings.dart';
import '../product/product_tile.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final productRepo = const ProductRepo();

  void _toogleFav(Product product) {
    if (wishListController.isProductThere(product)) {
      wishListController.removeProduct(product);
    }
    if (!wishListController.isProductThere(product)) {
      wishListController.addProduct(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tileHeight = size.height * 0.25;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (context) => const WishListView(),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: productRepo.allItens(),
        builder: ((context, snapshot) {
          return AnimatedBuilder(
            animation: wishListController,
            builder: (context, child) {
              return GridView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: ((size.width / 3) / tileHeight),
                ),
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];

                  return ProductTile(
                    isFavorite: wishListController.isProductThere(product),
                    product: product,
                    onFavClicked: () => _toogleFav(product),
                  );
                },
              );
            }
          );
        }),
      ),
    );
  }
}
