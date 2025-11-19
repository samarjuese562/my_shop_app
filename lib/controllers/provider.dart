import 'package:flutter/material.dart';
import 'package:my_shop_app/models/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cart = [];

  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    _cart.forEach((item) {
      total += double.parse(item.price);
    });
    return total;
  }
}
