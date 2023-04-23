import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../product/product.dart';

class ProductTile extends StatelessWidget {
  final bool isFavorite;
  final Product product;
  final VoidCallback onFavClicked;


  const ProductTile({super.key, required this.product, required this.onFavClicked, this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      color: Colors.white,
      child: Column(
        children: [
          Image.network(product.imageUrl),
          Row(
            children: [
              Column(
                children: [
                  Text(product.name),
                  Text(product.price.toString()),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: onFavClicked,
              ),
            ],
          )
        ],
      ),
    );
  }
}