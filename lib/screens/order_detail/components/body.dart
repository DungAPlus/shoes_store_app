import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/order_detail/components/option_button.dart';
import 'package:shop_app/screens/order_detail/components/payment_option.dart';
import 'package:shop_app/screens/order_detail/components/productListing.dart';
import 'package:shop_app/screens/order_detail/components/shipping_info.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  Body();
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            ShippingInfo(),
            SizedBox(height: getProportionateScreenWidth(30)),
            ProductListing(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PaymentOption(),
            SizedBox(height: getProportionateScreenWidth(30)),
            OptionButton(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
