import 'package:flutter/material.dart';
import 'package:p_team/model/product.dart';
import 'package:p_team/screens/product_screen.dart';

class DetailsPage extends Page {
  final Product product;

  DetailsPage({
    this.product,
  }) : super(key: ValueKey(product));

  Route createRoute(BuildContext context) {
    print("8");
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ProductDetailsScreen(product: product);
      },
    );
  }
}
