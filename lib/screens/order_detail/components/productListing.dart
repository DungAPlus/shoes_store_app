import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/models/PaymentOption.dart';
import 'package:shop_app/screens/order_detail/components/product_card.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final Order newOrder = arguments['order'];
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          SectionTitle(
            title: "Order details",
            press: () {},
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          ...List.generate(
            newOrder.cart!.demoCarts.length,
            (index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ProductCard(
                  index: index,
                  cartItem: newOrder.cart!.demoCarts[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
