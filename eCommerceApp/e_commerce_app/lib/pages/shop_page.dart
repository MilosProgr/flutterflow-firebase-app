import 'package:e_commerce_app/components/button.dart';
import 'package:e_commerce_app/components/my_drawer.dart';
import 'package:e_commerce_app/components/my_product_tile.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _controller = TextEditingController();
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    final products = context.read<Shop>().shop;
    filteredProducts = products;
  }

  void _searchProducts() {
    final products = context.read<Shop>().shop;
    setState(() {
      if (_controller.text.isEmpty) {
        filteredProducts = products;
      } else {
        filteredProducts = products
            .where(
              (p) =>
                  p.name.toLowerCase().contains(_controller.text.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Page"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                    ),

                    onSubmitted: (_) => _searchProducts(),
                  ),
                ),
                const SizedBox(width: 8),
                MyButton(onTap: _searchProducts, child: const Text("Find")),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
