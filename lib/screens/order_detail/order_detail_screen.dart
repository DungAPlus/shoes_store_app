import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/order_detail/components/check_out_card.dart';

import 'components/body.dart';

class OrderDetailScreen extends StatefulWidget {
  static String routeName = "/order-detail";

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Order Detail",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
