import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Spacer(flex: 2),
        Text(
          "ADADIS",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(40),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoSlab'),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 3),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(300),
        ),
      ],
    );
  }
}
