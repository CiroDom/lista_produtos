import 'dart:math';

import 'package:carrinho_compras_app/product/product.dart';
import 'package:faker/faker.dart';


class ProductRepo {
  const ProductRepo();

  Future<List<Product>> allItens() async {
    return List.generate(40, (index) {
      const min = 30;
      const max = 60;

      return Product(
        uid: faker.guid.guid(),
        name: faker.vehicle.model(),
        imageUrl: faker.image.image(),
        price: Random().nextInt(max - min) + Random().nextDouble(),
      );
    });
  }
}
