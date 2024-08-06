


import 'package:web_app/model/foorcart.dart';

class CartManager {
  static final CartManager _instance = CartManager._internal();

  factory CartManager() {
    return _instance;
  }

  CartManager._internal();

  final List<Param> _cartItems = [];

  List<Param> get cartItems => _cartItems;

  void addItem(Param item) {
    _cartItems.add(item);
  }

  void removeItem(Param item) {
    _cartItems.remove(item);
  }

  void clearCart() {
    _cartItems.clear();
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in _cartItems) {
      total += double.parse(item.variations.first.price) * item.variations.first.cartQuantity;
    }
    return total;
  }
}
