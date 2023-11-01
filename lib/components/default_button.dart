import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      this.text,
      this.press,
      this.buttonColor = kPrimaryGradientColor,
      this.width = double.infinity,
      this.height = 60,
      this.isDisabled = false})
      : super(key: key);
  final String? text;
  final Function? press;
  final LinearGradient? buttonColor;
  final double? width;
  final double? height;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        height: 120.0, // height of the button
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, // shape makes the circular button
            gradient: isDisabled ? kPrimaryGradientColor4 : buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ElevatedButton(
          onPressed: isDisabled ? () {} : press as void Function()?,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          child: Text(
            text!,
            style: TextStyle(fontSize: getProportionateScreenWidth(16)),
          ),
        ),
      ),
    );
  }
}
