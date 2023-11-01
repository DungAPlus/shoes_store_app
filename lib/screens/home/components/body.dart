import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/SearchData.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'newest_product.dart';
import 'special_offers.dart';
import 'search_result.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    searchMode.addListener(() => mounted ? setState(() {}) : null);
    cart.addListener(() => mounted ? setState(() {}) : null);
  }

  @override
  void dispose() {
    searchMode.removeListener(() {});
    cart.removeListener(() {});

    searchMode.setSearchText('');
    searchMode.onSearchChangeFocus(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(20)),
              HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(10)),
              (searchMode.searchText == '' && searchMode.brandSelected == -1)
                  ? Column(
                      children: [
                        DiscountBanner(),
                        Categories(),
                        SpecialOffers(),
                        SizedBox(height: getProportionateScreenWidth(30)),
                        PopularProducts(),
                        SizedBox(height: getProportionateScreenWidth(30)),
                        NewestProducts(),
                        SizedBox(height: getProportionateScreenWidth(30)),
                      ],
                    )
                  : SearchResults(),
            ],
          ),
        ),
        // SearchResults(),
      ],
    ));
  }
}
