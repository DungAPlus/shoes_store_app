import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_app/constants.dart';

void _showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: kPrimaryLightColor,
          size: 100,
        ),
      );
    },
  );

  // Simulate a delay (e.g., network request)
  Future.delayed(Duration(seconds: 3), () {
    Navigator.of(context).pop();
  });
}
