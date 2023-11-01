import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/PaymentOption.dart';
import 'package:shop_app/models/User.dart';

class Order {
  final String? id;
  final String? trackingNumber;
  final String? address;
  final String? customer;

  final DateTime? createdDay;
  final CartModel? cart;
  final PaymentOption? selectedPayment;
  String status;

  Order({
    this.id,
    this.trackingNumber,
    this.address,
    this.customer,
    this.createdDay,
    this.cart,
    this.selectedPayment,
    this.status = 'Confirmed',
  });
  Order.copyObject({required Order other})
      : id = other.id,
        trackingNumber = other.trackingNumber,
        address = other.address,
        customer = other.customer,
        createdDay = other.createdDay,
        cart = other.cart,
        selectedPayment = other.selectedPayment,
        status = other.status;
}

class OrderModel extends ChangeNotifier {
  Order _order = Order(
      id: '',
      trackingNumber: '',
      address: currentUser.address,
      customer: currentUser.fullName,
      createdDay: DateTime.now(),
      cart: cart,
      selectedPayment: currentPayment,
      status: 'Confirmed');

  Order get order => _order;

  void updateOrder(Order newOrder) {
    _order = Order(
      id: newOrder.id ?? _order.id,
      trackingNumber: newOrder.trackingNumber ?? _order.trackingNumber,
      address: newOrder.address ?? _order.address,
      createdDay: newOrder.createdDay ?? _order.createdDay,
      cart: newOrder.cart ?? _order.cart,
      selectedPayment: newOrder.selectedPayment ?? _order.selectedPayment,
      status: newOrder.status ?? _order.status,
      customer: newOrder.customer ?? _order.customer,
    );
    notifyListeners();
  }

  void resetOrder() {
    updateOrder(Order(
        id: '',
        trackingNumber: '',
        address: currentUser.address,
        customer: currentUser.fullName,
        createdDay: DateTime.now(),
        cart: cart,
        selectedPayment: currentPayment,
        status: 'Confirmed'));
    notifyListeners();
  }
}

OrderModel currentOrder = OrderModel();

class OrdersModel extends ChangeNotifier {
  List<Order> _orderListing = [];

  List<Order> get orderListing => _orderListing;

  void addToOrders(Order order) {
    // _orderListing.add(order);
    _orderListing.insert(0, order);

    notifyListeners();
  }

  void cancelOrder(Order order) {
    final index =
        _orderListing.indexWhere((orderItem) => orderItem.id == order.id);
    if (index >= 0) _orderListing.removeAt(index);
    notifyListeners();
  }

  void changeStatusOrder(Order order, String state) {
    final index =
        _orderListing.indexWhere((orderItem) => orderItem.id == order.id);
    if (index >= 0) _orderListing[index].status = state;
    notifyListeners();
  }
}

OrdersModel orders = OrdersModel();

// String shippingAddress = '2972 Westheimer Rd. Santa Ana, Illinois 85486 ';
