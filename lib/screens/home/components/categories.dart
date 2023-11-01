import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/SearchData.dart';

import '../../../size_config.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            // left: getProportionateScreenWidth(0),
            vertical: getProportionateScreenWidth(10)),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryCard(
                  icon: '',
                  text: 'Brand',
                  press: () {
                    searchMode.resetBrand();
                  },
                  isSelected: searchMode.brandSelected == -1,
                ),
                ...List.generate(
                  categories.length,
                  (index) => CategoryCard(
                    icon: categories[index].icon,
                    text: categories[index].text,
                    type: categories[index].type,
                    press: () {
                      if (searchMode.brandSelected == index) {
                        searchMode.setBrandSelected(-1);
                      } else {
                        searchMode.setBrandSelected(index);
                      }
                    },
                    isSelected: searchMode.brandSelected == index,
                  ),
                ),
              ]),
        ));
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key,
      required this.icon,
      required this.text,
      required this.press,
      required this.isSelected,
      this.type})
      : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;
  final String? type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (type == "item")
      return GestureDetector(
          onTap: press,
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: SizedBox(
              width: getProportionateScreenWidth(65),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                    height: getProportionateScreenWidth(45),
                    width: getProportionateScreenWidth(65),
                    decoration: BoxDecoration(
                        gradient: isSelected
                            ? kPrimaryGradientColor2
                            : kPrimaryGradientColor3,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: kPrimaryColor)),
                    child: SvgPicture.asset(icon!),
                  ),
                  SizedBox(height: 5),
                  // Text(text!, textAlign: TextAlign.center)
                ],
              ),
            ),
          ));
    else
      return GestureDetector(
          onTap: press,
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: SizedBox(
              width: getProportionateScreenWidth(80),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(0)),
                    height: getProportionateScreenWidth(45),
                    width: getProportionateScreenWidth(80),
                    decoration: BoxDecoration(
                        gradient: kPrimaryGradientColor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: kPrimaryColor)),
                    child: Center(
                      child: Text(
                        text!,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  // Text(text!, textAlign: TextAlign.center)
                ],
              ),
            ),
          ));
  }
}
