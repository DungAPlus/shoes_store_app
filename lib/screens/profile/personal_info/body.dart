import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/order/order_screen.dart';
import 'package:shop_app/screens/profile/my_profile_screen.dart';
import 'package:shop_app/screens/profile/personal_info/info_card.dart';
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
  User tempUser = User(
      id: currentUser.id,
      username: currentUser.username,
      email: currentUser.email,
      fullName: currentUser.fullName,
      address: currentUser.address,
      passwordHash: currentUser.passwordHash,
      phoneNumber: currentUser.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Personal Infomation',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.black,
              ),
            ),
            InfoCard(
                title: 'Email',
                content: tempUser.email,
                isDisabled: true,
                user: tempUser),
            InfoCard(
                title: 'Name',
                content: tempUser.fullName,
                isDisabled: !canBeEdit,
                user: tempUser,
                updateInfo: (newName) {
                  tempUser.updateUserInfo(
                      newName, tempUser.phoneNumber, tempUser.address);
                }),
            InfoCard(
                title: 'Phone number',
                content: tempUser.phoneNumber,
                isDisabled: !canBeEdit,
                user: tempUser,
                updateInfo: (newPhoneNumber) {
                  tempUser.updateUserInfo(
                      tempUser.fullName, newPhoneNumber, tempUser.address);
                }),
            InfoCard(
                title: 'Address',
                content: tempUser.address,
                isDisabled: !canBeEdit,
                user: tempUser,
                updateInfo: (newAddress) {
                  tempUser.updateUserInfo(
                      tempUser.fullName, tempUser.phoneNumber, newAddress);
                }),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: canBeEdit
                    ? Container(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DefaultButton(
                            text: 'Cancel',
                            width: getProportionateScreenWidth(150),
                            press: () {
                              tempUser.updateUserInfo(currentUser.fullName,
                                  currentUser.phoneNumber, currentUser.address);
                              setState(() {
                                canBeEdit = false;
                              });
                            },
                          ),
                          DefaultButton(
                            text: 'Save',
                            width: getProportionateScreenWidth(150),
                            press: () {
                              currentUser.updateUserInfo(tempUser.fullName,
                                  tempUser.phoneNumber, tempUser.address);
                              setState(() {
                                canBeEdit = false;
                              });
                            },
                          )
                        ],
                      ))
                    : DefaultButton(
                        text: 'Edit info',
                        press: () {
                          setState(() {
                            canBeEdit = true;
                          });
                        },
                      ))
          ],
        ),
      ),
    );
  }
}
