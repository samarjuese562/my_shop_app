import 'package:flutter/material.dart';
import 'package:my_shop_app/cartpage.dart';
import 'package:my_shop_app/controllers/provider.dart';
import 'package:my_shop_app/models/product.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(name: "Product 1", price: "100", image: "assets/product1.png"),
    Product(name: "Product 2", price: "200", image: "assets/product2.png"),
    Product(name: "Product 3", price: "300", image: "assets/product3.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop App'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(product.image, width: 50, height: 50),
              title: Text(product.name),
              subtitle: Text("\$${product.price}"),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  cartProvider.addToCart(product);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
