import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  Body();
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: cart.demoCarts.length > 0
          ? ListView.builder(
              itemCount: cart.demoCarts.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    cart.removeFromCart(index);
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child:
                      CartCard(cartItem: cart.demoCarts[index], index: index),
                ),
              ),
              shrinkWrap: true,
            )
          : SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 200, horizontal: 50),
                child: SvgPicture.asset(
                  "assets/icons/Empty List.svg",
                  width: 200,
                  height: 200,
                  color: Colors.grey.shade300,
                ),
              )),
    );
  }
}
