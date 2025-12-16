import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop_app/components/shoe_tile.dart';
import 'package:sneaker_shop_app/models/cart.dart';

import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Shoe> _search_result = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _search_result = context.read<Cart>().getShoeList();
  }

  void _handleSearch(String input) {
    final allShoes = context.read<Cart>().getShoeList();

    setState(() {
      _search_result = allShoes
          .where(
            (shoe) => shoe.name.toLowerCase().contains(input.toLowerCase()),
          )
          .toList();
    });
  }

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: Text('${shoe.name} added to cart!'),
      ),
    );

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('${shoe.name} added to cart!'),
    //     duration: const Duration(seconds: 1),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        final shoesToShow = _search_result.isEmpty
            ? value.getShoeList()
            : _search_result;

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                onChanged: _handleSearch,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                'everyone flies.. some fly longer than others',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "Hot picks 🔥",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shoesToShow.length,
                itemBuilder: (context, index) {
                  final shoe = shoesToShow[index];
                  return ShoeTile(shoe: shoe, onTap: () => addShoeToCart(shoe));
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
              child: Divider(color: Colors.grey),
            ),
          ],
        );
      },
    );
  }
}
