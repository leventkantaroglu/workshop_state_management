import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart_viewmodel.dart';

class ClearButton extends StatefulWidget {
  const ClearButton({Key? key}) : super(key: key);

  @override
  State<ClearButton> createState() => _ClearButtonState();
}

class _ClearButtonState extends State<ClearButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          context.read<CartViewModel>().clearCart();
        },
        child: const Text("Sepeti Boşalt"),
      ),
    );
  }
}
