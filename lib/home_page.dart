import 'package:flutter/material.dart';
import 'package:workshop_state_management/cart_item.dart';
import 'package:workshop_state_management/products.dart';
import 'package:collection/collection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CartItem> cartItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bizim Market",
        ),
        centerTitle: false,
        actions: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
                if (cartItemList.isNotEmpty)
                  Positioned.fill(
                    bottom: -4,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 11,
                        child: Text(
                          cartItemList.length.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text("Tüm Ürünler"),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: products.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(products[index]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (cartItemList.firstWhereOrNull(
                              (item) => item.product == products[index],
                            ) ==
                            null) {
                          setState(() {
                            cartItemList.add(CartItem(products[index], 1));
                          });
                        } else {
                          var item = cartItemList.firstWhere(
                              (item) => item.product == products[index]);

                          setState(() {
                            item.count += 1;
                          });
                        }
                      },
                      child: const Text("+"),
                    ),
                    Text(cartItemList
                            .firstWhereOrNull(
                              (item) => item.product == products[index],
                            )
                            ?.count
                            .toString() ??
                        "0"),
                    const TextButton(
                      onPressed: null,
                      child: Text("-"),
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  cartItemList.clear();
                });
              },
              child: const Text("Sepeti Boşalt"),
            ),
          ),
        ],
      ),
    );
  }

  addToCart(String product) {
    setState(() {
      cartItemList.add(CartItem(product, 1));
    });
  }

  increaseCount(String product) {
    var currentItem =
        cartItemList.firstWhere((item) => item.product == product);

    setState(() {
      currentItem.count += 1;
    });
  }

  removeFromCart() {
    // ...
  }

  decreaseCount() {
    // ...
  }
}
