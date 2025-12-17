import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //products for sale
  List<Product> _shop = [
    Product(
      name: "Product Hoodie",
      price: 50.2,
      description: "This is a good tshort",
      imagePath: 'images/hoodie.png',
    ),
    Product(
      name: "Product Clock",
      price: 50.2,
      description: "This is a good shoe",
      imagePath: 'images/clock.png',
    ),
    Product(
      name: "Product Suit",
      price: 50.2,
      description: "This is a good cigare",
      imagePath: 'images/suit.png',
    ),
    Product(
      name: "Product wine",
      price: 50.2,
      description: "This is a good fine wine",
      imagePath: 'images/wine.png',
    ),
  ];
  //user cart
  List<Product> _cart = [];
  //get product list
  List<Product> get shop => _shop;
  //get user cart
  List<Product> get cart => _cart;
  //add item to cart
  void addItemToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
