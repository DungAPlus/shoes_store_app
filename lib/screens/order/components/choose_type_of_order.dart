import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Order.dart';
import 'package:shop_app/models/PaymentOption.dart';
import 'package:shop_app/screens/order_detail/order_detail_screen.dart';
import 'package:shop_app/utils/create_id.dart';
// import 'package:intl/intl';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChooseTypeOfOrders extends StatefulWidget {
  const ChooseTypeOfOrders({
    Key? key,
    required this.type,
    required this.setType,
  }) : super(key: key);
  final String type;
  final Function setType;
  @override
  _ChooseTypeOfOrdersState createState() => _ChooseTypeOfOrdersState();
}

class _ChooseTypeOfOrdersState extends State<ChooseTypeOfOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50, // height of the button
            decoration: BoxDecoration(
                shape: BoxShape.rectangle, // shape makes the circular button
                gradient: (widget.type == 'Confirmed')
                    ? kPrimaryGradientColor
                    : LinearGradient(
                        colors: [Colors.white, Colors.white],
                      ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: kPrimaryColor, width: 1.5)),
            child: ElevatedButton(
              onPressed: () {
                widget.setType('Confirmed');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: Text(
                'Confirmed',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: (widget.type == 'Confirmed')
                        ? Colors.white
                        : kPrimaryColor),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 50, // height of the button
            decoration: BoxDecoration(
                shape: BoxShape.rectangle, // shape makes the circular button
                gradient: (widget.type == 'Delivered')
                    ? kPrimaryGradientColor
                    : LinearGradient(
                        colors: [Colors.white, Colors.white],
                      ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: kPrimaryColor, width: 1.5)),
            child: ElevatedButton(
              onPressed: () {
                widget.setType('Delivered');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: Text(
                'Delivered',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: (widget.type == 'Delivered')
                        ? Colors.white
                        : kPrimaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
