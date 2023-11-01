import 'package:flutter/material.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/payment/components/shipping_card.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class ShippingInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          SectionTitle(
            title: "Shipping address",
            press: () {},
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          ShippingCard(shippingAddress: currentUser.address)
        ],
      ),
    );
  }
}
