import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/screens/order/components/choose_type_of_order.dart';
import 'package:shop_app/screens/order/components/order_card.dart';
import 'package:shop_app/screens/payment/components/payment_option.dart';
import 'package:shop_app/screens/payment/components/shipping_info.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String type = 'Confirmed';
  String setType(String newType) {
    setState(() {
      type = newType;
    });
    return newType;
  }



  @override
  Widget build(BuildContext context) {
    List<Order> selectedOrderList = orders.orderListing
        .where((orderItem) => orderItem.status == type)
        .toList();
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              ChooseTypeOfOrders(type: type, setType: setType),
              SizedBox(height: getProportionateScreenWidth(30)),
              Column(
                children: selectedOrderList.length > 0
                    ? [ //if 
                        ...List.generate(
                          selectedOrderList.length,
                          (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: OrderCard(
                                orderItem: selectedOrderList[index],
                              ),
                            );
                          },
                        ),
                      ]
                    : [ //else
                        SizedBox(
                            width: double.maxFinite,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 100, horizontal: 50),
                              child: SvgPicture.asset(
                                "assets/icons/Empty List.svg",
                                width: 200,
                                height: 200,
                                color: Colors.grey.shade300,
                              ),
                            ))
                      ],
              ),
              // if (orders.orderListing.length != 0)

              //   else ...List.build(context),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
      ),
    );
  }
}
