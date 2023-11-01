import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/order/order_screen.dart';
import 'package:shop_app/screens/profile/my_profile_screen.dart';
import 'package:shop_app/screens/profile/password/info_card.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/utils/slide_animation.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool canBeEdit = false;
  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  String errorText = '';

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              errorText,
              style: TextStyle(fontSize: 15),
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            DefaultButton(
              text: 'Cancel',
              width: 120,
              height: 50,
              press: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void handleChangePassword() {
    if (currentPassword != currentUser.passwordHash) {
      setState(() {
        errorText = 'Current password is wrong';
      });
    }

    if (newPassword != confirmPassword) {
      setState(() {
        errorText = 'Passwords don\'t match';
      });
    }
    if (errorText != '') {
      _dialogBuilder(context);
      return;
    }

    Fluttertoast.showToast(
        msg: "Successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: kPrimaryColor,
        textColor: Colors.white,
        fontSize: 16.0);

    currentUser.changePassword(newPassword);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InfoCard(
                    title: 'Current password',
                    content: 'Enter your current password',
                    updateText: (String newText) {
                      setState(() {
                        currentPassword = newText;
                      });
                    }),
                InfoCard(
                    title: 'New Password',
                    content: 'Enter your new password',
                    updateText: (String newText) {
                      setState(() {
                        newPassword = newText;
                      });
                    }),
                InfoCard(
                    title: 'Confirm Password',
                    content: 'Enter your new password ',
                    updateText: (String newText) {
                      setState(() {
                        confirmPassword = newText;
                      });
                    }),
                // Row(
                //   children: [
                //     SvgPicture.asset(
                //       "assets/icons/Error.svg",
                //       height: getProportionateScreenWidth(14),
                //       width: getProportionateScreenWidth(14),
                //     ),
                //     SizedBox(
                //       width: getProportionateScreenWidth(10),
                //     ),
                //     Text(''),
                //   ],
                // ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: DefaultButton(
                      text: 'Change password',
                      press: () {
                        handleChangePassword();
                      },
                      isDisabled: currentPassword == '' ||
                          newPassword == '' ||
                          confirmPassword == '',
                    ))
              ])),
    );
  }
}
