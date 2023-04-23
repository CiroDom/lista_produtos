import 'package:carrinho_compras_app/app_widget/wishlist_controller.dart/wishlist_controller.dart';
import 'package:flutter/material.dart';

import 'app_widget/app_widget.dart';

final wishListController = WishListController();

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppWidget();
  }
}
