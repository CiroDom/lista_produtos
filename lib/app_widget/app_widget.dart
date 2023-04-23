import 'package:carrinho_compras_app/app_widget/views/products_view.dart';
import 'package:flutter/material.dart';

import '../res/strings.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductsView(),
    );
  }
}
