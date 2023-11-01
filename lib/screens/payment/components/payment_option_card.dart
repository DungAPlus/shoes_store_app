import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/PaymentOption.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:provider/provider.dart';

class PaymentOptionCard extends StatefulWidget {


  @override
  _PaymentOptionCardState createState() => _PaymentOptionCardState();
}

class _PaymentOptionCardState extends State<PaymentOptionCard> {
  int selectedOption = 0;
  void setSelectedRadio(int val) {
    setState(() {
      selectedOption = val;
      currentPayment = demoPayment[val];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...List.generate(// vòng for..range
                demoPayment.length,// axit bank & hdfc Bank
                (index) {
                  return PaymentRadio( //với mỗi index tạo ra 1 payment radio
                    index: index,
                    selectedOption: selectedOption,//giá trị đang chọn
                    onChangeValue: setSelectedRadio,//khi thay đổi giá trị
                  );
                },
              ),

                //  Padding(
                //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                //   child: Row(
                //     children: [
                //       SvgPicture.asset(
                //         "assets/icons/add.svg",
                //         height: getProportionateScreenWidth(20),
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Text(
                //         'Add new card',
                //         style: TextStyle(color: Colors.grey),
                //       )
                //     ],
                //   ),
                // ),

            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17),
              topRight: Radius.circular(17),
              bottomLeft: Radius.circular(17),
              bottomRight: Radius.circular(17)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ));
  }
}

class PaymentRadio extends StatefulWidget {
  const PaymentRadio(
      {Key? key,
      required this.selectedOption,
      required this.index,
      required this.onChangeValue})
      : super(key: key);
  final int selectedOption;
  final int index;

  final Function onChangeValue;
  @override
  _PaymentRadioState createState() => _PaymentRadioState();
}

class _PaymentRadioState extends State<PaymentRadio> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
              width: 50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: SvgPicture.asset(
                  demoPayment[widget.index].icon,
                  height: getProportionateScreenWidth(20),
                ),
              )),
          Flexible(
            child: Text(
              demoPayment[widget.index].bankName,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Text(
              hideAccountNumber(demoPayment[widget.index].accountNumber),
              style: TextStyle(color: Colors.grey, fontSize: 12),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
      value: widget.index,
      groupValue: widget.selectedOption,
      onChanged: (value) {
        widget.onChangeValue(value);
      },
      controlAffinity: ListTileControlAffinity.trailing,
      fillColor:
          MaterialStateColor.resolveWith((states) => kPrimaryMediumColor),
    );
  }
}
