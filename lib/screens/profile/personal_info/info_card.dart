import 'package:flutter/material.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/size_config.dart';

class InfoCard extends StatefulWidget {
  const InfoCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.isDisabled,
      required this.user,
      this.updateInfo})
      : super(key: key);

  final String title;
  final String content;
  final bool isDisabled;
  final Function? updateInfo;
  final User user;

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  final myController = TextEditingController();
  bool isUpdating = false;
  @override
  void initState() {
    super.initState();
    myController.text = widget.content;
    widget.user.addListener(() {
      if (!isUpdating) {
        myController.text = widget.content;
      }
      setState(() {
        isUpdating = false;
      });
    });

    myController.addListener(() {
      if (widget.updateInfo != null) {
        setState(() {
          isUpdating = true;
        });
        widget.updateInfo!(myController.text);
      }
    });
  }

  @override
  void didUpdateWidget(covariant InfoCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.content != widget.content) {
      // The parameter has changed
      myController.text = widget.content;

      setState(() {});
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 12),
            ),
            TextField(
              controller: myController,
              enabled: !widget.isDisabled,
              // onChanged: (value) =>
              //     {print(value), searchMode.setSearchText(value)},
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelStyle: TextStyle(fontSize: 12)),
            ),
            // Text(widget.content),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
