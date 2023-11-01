import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/models/PaymentOption.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final Order newOrder = arguments['order'];
    if (newOrder.status == 'Confirmed')
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: DefaultButton(
                text: "Finish order",
                height: 50,
                buttonColor: kPrimaryGradientColor,
                press: () {
                  orders.changeStatusOrder(newOrder, 'Delivered');
                  Fluttertoast.showToast(
                      msg: "Order has been delivered!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: kPrimaryColor,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );
    else
      return SizedBox();
  }
}
