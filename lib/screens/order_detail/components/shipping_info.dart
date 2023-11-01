import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/Order.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class ShippingInfo extends StatelessWidget {
  const ShippingInfo({
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectionTitle(
                title: "Order No.${newOrder.id}",
                press: () {},
              ),
              Text(
                  "${DateFormat('HH:mm  dd/MM/yyyy').format(newOrder.createdDay!)}")
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tracking Number VN${newOrder.trackingNumber}"),
              Text(
                "${newOrder.status}",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${newOrder.customer}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            width: 30,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: SvgPicture.asset(
                                'assets/icons/Location point.svg',
                                height: getProportionateScreenWidth(18),
                              ),
                            )),
                        Flexible(
                          child: Text(
                            '${newOrder.address}',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                      ],
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
