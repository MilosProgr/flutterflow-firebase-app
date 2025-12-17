import 'package:e_commerce_app/components/button.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        content: const Text("Remove this item from your cart ?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          MaterialButton(
            onPressed: () => {
              Navigator.pop(context),

              //add to cart
              context.read<Shop>().removeItemFromCart(product),
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  //korisnik pritisnuo plati
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "Korisnik hoce da plati,Konektuj ovaj app u tvoj payment backend",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop Page"),
      ),
      drawer: const Drawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Tvoja korpa je prazna"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual item from cart
                      final item = cart[index];
                      // return as a cart tile UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),
          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text("Pay"),
            ),
          ),
        ],
      ),
    );
  }
}
