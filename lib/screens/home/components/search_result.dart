import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/SearchData.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/screens/home/components/categories.dart';
import 'package:shop_app/size_config.dart';

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  void initState() {
    super.initState();
    searchMode.addListener(() => mounted ? setState(() {}) : null);
  }

  @override
  void dispose() {
    searchMode.removeListener(() {});

    super.dispose();
  }

  bool checkProduct(Product product) {
    if (searchMode.searchText != '') {
      if ((' ' + product.title.toUpperCase())
          .contains(' ' + searchMode.searchText.toUpperCase())) {
        if (searchMode.brandSelected == -1) return true;
        if (product.brand == categories[searchMode.brandSelected].text)
          return true;
        return false;
      }
      return false;
    }

    if (searchMode.brandSelected != -1) if (product.brand ==
        categories[searchMode.brandSelected].text) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    List<Product> result =
        demoProducts.where((product) => checkProduct(product)).toList();

    return Container(
        child: Column(children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                child: IconButton(
                  onPressed: () {
                    searchMode.resetBrand();
                    searchMode.setSearchText('');
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: kPrimaryColor,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0)),
            Categories()
          ]),
      (result.length > 0)
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                spacing: 08.0, // Horizontal spacing between items
                runSpacing: 0.0, // Vertical spacing between rows
                children: [
                  ...List.generate(
                    result.length,
                    (index) {
                      return ProductCard(product: result[index]);
                    },
                  ),
                ],
              ),
            )
          : SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 200, horizontal: 50),
                child: SvgPicture.asset(
                  "assets/icons/Empty List.svg",
                  width: 200,
                  height: 200,
                  color: Colors.grey.shade300,
                ),
              )),
    ]));
  }
}
