import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:provider/provider.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    required this.cartItem,
    required this.index,
  }) : super(key: key);

  final CartItem cartItem;
  final int index;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            SizedBox(
                width: 88,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: AspectRatio(
                      aspectRatio: 0.88,
                      child: Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(10)),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(widget.cartItem.product.images[0]),
                      ),
                    ))),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cartItem.product.title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "\$${widget.cartItem.product.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryMediumColor),
                      ),
                    ),
                    SizedBox(width: 40),
                    Text(
                      "Size: ${widget.cartItem.size}",
                    )
                  ],
                ),
                Row(
                  children: [
                    RoundedIconBtn(
                      size: 30,
                      icon: Icons.remove,
                      showShadow: true,
                      press: () {
                        setState(() {
                          if (widget.cartItem.numOfItem > 1) {
                            cart.updateAmountOfProduct(widget.index, -1);
                          }
                        });
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Text(
                      widget.cartItem.numOfItem.toString(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    RoundedIconBtn(
                      size: 30,
                      icon: Icons.add,
                      showShadow: true,
                      press: () {
                        setState(() {
                          cart.updateAmountOfProduct(widget.index, 1);
                        });
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17),
              topRight: Radius.circular(17),
              bottomLeft: Radius.circular(17),
              bottomRight: Radius.circular(17)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ));
  }
}
