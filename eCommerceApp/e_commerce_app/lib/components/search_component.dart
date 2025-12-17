import 'package:e_commerce_app/components/my_product_tile.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class GFG extends StatefulWidget {
  final List<Product> product;
  const GFG({super.key, required this.product});

  @override
  State<GFG> createState() => _GFGState();
}

class _GFGState extends State<GFG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pretrazi",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Method to show the search bar
              showSearch(
                context: context,

                // Delegate to customize the search bar
                delegate: CustomSearchDelegate(products: widget.product),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  final List<Product> products;
  CustomSearchDelegate({required this.products});

  // First overwrite to clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // Second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // Third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchQuery = [];
    for (var product in products) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return MyProductTile(product: result);
      },
    );
  }

  // Last overwrite to show the querying
  // process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    // Ako je query prazan, prikazujemo sve proizvode
    List<Product> matchQuery = [];
    if (query.isEmpty) {
      matchQuery = products;
    } else {
      matchQuery = products
          .where(
            (product) =>
                product.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final product = matchQuery[index];
        return MyProductTile(product: product); // koristi svoj tile
      },
    );
  }
}
