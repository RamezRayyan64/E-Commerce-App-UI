import 'package:e_commerce/utilities/constants.dart';
import 'package:e_commerce/utilities/size_config.dart';
import 'package:e_commerce/widgets/welcome/top_texts_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    Key? key,
    required this.text,
    required this.sourceImage,
  }) : super(key: key);

  final String? text;
  final String? sourceImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        TopTextsWidget(
          upperText: 'TOKOTO',
          downText: text!,
          textColor: kPrimaryColor,
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          'assets/images/$sourceImage.png',
          width: getProportionateScreenWidth(235),
          height: getProportionateScreenHeight(265),
        )
      ],
    );
  }
}
