import 'package:flutter/material.dart';
import 'package:shop_app/screens/order/order_screen.dart';
import 'package:shop_app/screens/profile/my_profile_screen.dart';
import 'package:shop_app/screens/profile/password.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/utils/slide_animation.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Profile",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.push(context, SlideRightRoute(page: MyProfileScreen()))
            },
          ),
          ProfileMenu(
            text: "My Orders",
            icon: "assets/icons/Orders.svg",
            press: () {
              Navigator.push(context, SlideRightRoute(page: OrdersScreen()));
            },
          ),
          ProfileMenu(
            text: "Change Password",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.push(context, SlideRightRoute(page: PasswordScreen()));
            },
          ),
          // ProfileMenu(
          //   text: "Help Center",
          //   icon: "assets/icons/Question mark.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              // Navigator.pushNamed(context, SignInScreen.routeName);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
