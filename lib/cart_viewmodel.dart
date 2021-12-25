import 'package:flutter/foundation.dart';
import 'package:workshop_state_management/cart_item.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartItem> _cartItemList = [];

  List<CartItem> get cartItemList => _cartItemList;

  void clearCart() {
    _cartItemList.clear();
    notifyListeners();
  }

  void addToCart(String product) {
    _cartItemList.add(CartItem(product, 1));
    notifyListeners();
  }

  void increaseCount(String product) {
    var currentItem =
        _cartItemList.firstWhere((item) => item.product == product);
    currentItem.count += 1;
    notifyListeners();
  }

  removeFromCart() {
    // ...
  }

  decreaseCount() {
    // ...
  }
}
