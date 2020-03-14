import 'package:flutter/material.dart';

import '../widgets/Products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProdutctsOverview extends StatefulWidget {
  @override
  _ProdutctsOverviewState createState() => _ProdutctsOverviewState();
}

class _ProdutctsOverviewState extends State<ProdutctsOverview> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          )
        ],
      ),
      body: new ProductsGrid(_showOnlyFavorites),
    );
  }
}
