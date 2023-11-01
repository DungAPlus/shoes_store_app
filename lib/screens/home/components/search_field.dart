import 'package:flutter/material.dart';
import 'package:shop_app/models/SearchData.dart';
import 'package:shop_app/screens/home/components/search_result.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    final text = myController.text;
    searchMode.setSearchText(text);
  }

  @override
  Widget build(BuildContext context) {
    myController.text = searchMode.searchText;

    return Container(
        width: SizeConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: FocusScope(
            child: Focus(
                onFocusChange: (focus) => {
                      searchMode.onSearchChangeFocus(focus),
                      print(focus),
                    },
                child: Column(
                  children: [
                    TextField(
                      controller: myController,
                      // onChanged: (value) =>
                      //     {print(value), searchMode.setSearchText(value)},
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20),
                              vertical: getProportionateScreenWidth(9)),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search product",
                          suffixIcon: myController.text == ''
                              ? null
                              : IconButton(
                                  icon: Icon(
                                    Icons.highlight_off,
                                    color: kPrimaryColor,
                                  ),
                                  onPressed: () {
                                    myController.text = '';
                                  },
                                ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: kPrimaryColor,
                          )),
                    ),
                  ],
                ))));
  }
}
