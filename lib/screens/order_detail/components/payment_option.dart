import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/models/PaymentOption.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PaymentOption extends StatelessWidget {
  const PaymentOption({
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
            title: "Payment",
            press: () {},
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                        width: 50,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: SvgPicture.asset(
                            '${newOrder.selectedPayment?.icon}',
                            height: getProportionateScreenWidth(20),
                          ),
                        )),
                    Flexible(
                      child: Text(
                        '${newOrder.selectedPayment?.bankName}',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        hideAccountNumber(
                          '${newOrder.selectedPayment?.accountNumber}',
                        ),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
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
              )),
        ],
      ),
    );
  }
}
