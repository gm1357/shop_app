import 'package:flutter/material.dart';

import '../widgets/Products_grid.dart';

class ProdutctsOverview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: new ProductsGrid(),
    );
  }
}
