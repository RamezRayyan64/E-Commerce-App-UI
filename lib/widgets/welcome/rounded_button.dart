import 'package:e_commerce/utilities/constants.dart';
import 'package:e_commerce/utilities/size_config.dart';
import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const RoundedButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getProportionateScreenHeight(50),
        width: getProportionateScreenWidth(double.infinity),
        child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            ),
          ),
        ));
  }
}
