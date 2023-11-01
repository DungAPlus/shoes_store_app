import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/User.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:provider/provider.dart';

class ShippingCard extends StatefulWidget {
  const ShippingCard({   // Đã truyền shipping adress trước đó
    Key? key,
    required this.shippingAddress,
  }) : super(key: key);

  final String shippingAddress;

  @override
  _ShippingCardState createState() => _ShippingCardState();
}

class _ShippingCardState extends State<ShippingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //Căn trái theo trục ngang trong column
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,// các thành phần căn đều nhau nhưng không căn mép trên và dưới
                children: [
                  Text(
                    currentUser.fullName,
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Coming soon!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: kPrimaryColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(color: kPrimaryMediumColor),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,// căn nội dung về bên trái
                children: <Widget>[
                  SizedBox(
                      width: 30,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: SvgPicture.asset(
                          'assets/icons/Location point.svg',
                          height: getProportionateScreenWidth(18),
                        ),
                      )),
                  Flexible(
                    child: Text(
                      widget.shippingAddress,
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
        ));
  }
}
