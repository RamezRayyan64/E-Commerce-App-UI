import 'package:e_commerce_app_ui/utilities/size_config.dart';
import 'package:flutter/material.dart';

class TopTextsWidget extends StatelessWidget {
  final String upperText;
  final String downText;
  final Color? textColor;

  const TopTextsWidget({
    Key? key,
    required this.upperText,
    required this.downText,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          upperText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(28),
              color: textColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            downText,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
