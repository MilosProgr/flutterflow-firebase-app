import 'package:flutter/material.dart';
import 'package:sneaker_shop_app/models/shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Nike Air Max',
      description: 'Best for running',
      price: '199',
      imagePath: 'lib/images/air_max.png',
    ),

    Shoe(
      name: 'primer 2',
      description: 'Jos neki primer',
      price: '299',
      imagePath:
          'lib/images/Wales_Bonner_Karintha_Lo_Shoes_Black_JR0259_01_00_standard.png',
    ),
    Shoe(
      name: 'primer 3',
      description: 'Sjajne patike',
      price: '199',
      imagePath: 'lib/images/mephisto.png',
    ),
    Shoe(
      name: 'primer 4',
      description: 'Jos neki primer',
      price: '299',
      imagePath: 'lib/images/maison_margiela_sprinter.png',
    ),
    Shoe(
      name: 'primer 5',
      description: 'Jos neki primer',
      price: '499',
      imagePath: 'lib/images/heyley_wilson_x_nike.png',
    ),
    Shoe(
      name: 'primer 2',
      description: 'Jos neki primer',
      price: '299',
      imagePath: 'lib/images/spencer_badu_x_hoka_elevon_x.png',
    ),
    Shoe(
      name: 'primer 2',
      description: 'Jos neki primer',
      price: '299',
      imagePath: 'lib/images/temptation_vacation_x_asics_gel-DS_trainer14.png',
    ),
    Shoe(
      name: 'primer 2',
      description: 'Jos neki primer',
      price: '299',
      imagePath:
          'lib/images/Wales_Bonner_Karintha_Lo_Shoes_Black_JR0259_01_00_standard.png',
    ),
  ];
  //list of items in the cart
  List<Shoe> userCart = [];
  //get list of shoes in the cart
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void RemoveItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
