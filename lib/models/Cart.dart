import 'package:flutter/material.dart';

import 'Product.dart';

class CartItem {
  final Product product;
  final int size;

  int numOfItem;

  CartItem(
      {required this.product, required this.numOfItem, required this.size});
}

class CartModel extends ChangeNotifier {
  List<CartItem> _demoCarts;
  double _totalValue;
  int _totalQuantity;

  double get totalValue => _totalValue;
  List<CartItem> get demoCarts => _demoCarts;
  int get totalQuantity => _totalQuantity;

  CartModel.copyObject({required CartModel other})
      : _demoCarts = other._demoCarts,
        _totalValue = other._totalValue,
        _totalQuantity = other._totalQuantity;

  CartModel()
      : _demoCarts = [],
        _totalValue = 0,
        _totalQuantity = 0;

  void addToCart(CartItem cartItem) {
    final index = _demoCarts.indexWhere((item) =>
        item.product == cartItem.product && item.size == cartItem.size);
    if (index == -1) {
      _demoCarts.add(new CartItem(
          product: cartItem.product,
          numOfItem: cartItem.numOfItem,
          size: cartItem.size));
    } else {
      _demoCarts[index].numOfItem += cartItem.numOfItem;
    }
    _totalValue += cartItem.numOfItem * cartItem.product.price;
    _totalQuantity += cartItem.numOfItem;
    notifyListeners();
  }

  void removeFromCart(int index) {
    _totalValue -=
        _demoCarts[index].numOfItem * _demoCarts[index].product.price;
    _totalQuantity -= _demoCarts[index].numOfItem;

    _demoCarts.removeAt(index);
    notifyListeners();
  }

  void updateAmountOfProduct(int index, int change) {
    _demoCarts[index].numOfItem += change;
    _totalValue += change * _demoCarts[index].product.price;
    _totalQuantity += change;
    notifyListeners();
  }
}

void resetCart() {
  cart = new CartModel();
}

CartModel cart = CartModel();
