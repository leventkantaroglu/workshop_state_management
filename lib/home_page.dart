import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_state_management/cart_viewmodel.dart';
import 'package:workshop_state_management/products.dart';
import 'package:collection/collection.dart';

import 'widgets/clear_button.dart';
import 'widgets/plus_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var cartItemList = context.watch<CartViewModel>().cartItemList;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bizim Market",
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              context.read<CartViewModel>().clearCart();
            },
            icon: const Icon(Icons.clear),
          ),
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
                    PlusButton(
                      onPressed: () {
                        if (cartItemList.firstWhereOrNull(
                              (item) => item.product == products[index],
                            ) ==
                            null) {
                          context
                              .read<CartViewModel>()
                              .addToCart(products[index]);
                        } else {
                          context
                              .read<CartViewModel>()
                              .increaseCount(products[index]);
                        }
                      },
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
                    ),
                  ],
                );
              },
            ),
          ),
          const ClearButton(),
        ],
      ),
    );
  }
}
