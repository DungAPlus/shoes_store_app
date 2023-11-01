import 'package:flutter/material.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SizeDots extends StatefulWidget {
  const SizeDots({
    Key? key,
    required this.product,
    required this.selectAmount,
    required this.selectSize,
  }) : super(key: key);

  final Product product;
  final Function selectAmount;
  final Function selectSize;

  @override
  _SizeDotsState createState() => _SizeDotsState();
}

class _SizeDotsState extends State<SizeDots> {
  int selectedSize = 0;
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          Row(children: [
            ...List.generate(
              widget.product.sizes.length,
              (index) => SizeDot(
                  size: widget.product.sizes[index],
                  isSelected: index == selectedSize,
                  press: () {
                    widget.selectSize(widget.product.sizes[index]);
                    setState(() {
                      selectedSize = index;
                    });
                  }),
            ),
          ]),
          Spacer(),
          Row(
            children: [
              RoundedIconBtn(
                showShadow: true,
                icon: Icons.remove,
                press: () {
                  setState(() {
                    if (amount > 1) {
                      amount -= 1;
                      widget.selectAmount(amount);
                    }
                    ;
                  });
                },
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Text(
                amount.toString(),
                textAlign: TextAlign.center,
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              RoundedIconBtn(
                icon: Icons.add,
                showShadow: true,
                press: () {
                  setState(() {
                    amount += 1;
                    widget.selectAmount(amount);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SizeDot extends StatelessWidget {
  const SizeDot({
    Key? key,
    required this.size,
    this.isSelected = false,
    required this.press,
  }) : super(key: key);

  final int size;
  final bool isSelected;
  final GestureTapCancelCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(right: 1),
        padding: EdgeInsets.all(getProportionateScreenWidth(3)),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent),
          shape: BoxShape.circle,
        ),
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "$size",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            )),
      ),
    );
  }
}
