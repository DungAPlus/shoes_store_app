import 'dart:convert';

import 'package:shop_app/models/Cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveCart(CartModel currentCart) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // String cartJson = json.encode(currentCart);

  prefs.setString('currentCart', '1');
}

Future<CartModel?> fetchCurrentCard() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? cartJson = prefs.getString('currentCart');

  // if (cartJson != null) {
  //   // CartModel currentCart = CartModel(json.decode(cartJson));

  //   return currentCart;
  // }
  return null;
}
