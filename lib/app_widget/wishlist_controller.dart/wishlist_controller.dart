import 'package:carrinho_compras_app/product/product.dart';
import 'package:flutter/foundation.dart';

class WishListController extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => [...products];

  double get totalPrice => _products.map((p) => p.price).reduce((a, b) => a = b);

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products = _products.where((p) => p.uid != product.uid).toList();
    notifyListeners();
  }

  bool isProductThere(Product product) {
    return _products.indexWhere((p) => p.uid == product.uid) > -1;
  }
}
