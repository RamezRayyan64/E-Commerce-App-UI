import 'package:e_commerce/utilities/constants.dart';
import 'package:flutter/material.dart';

class AccountStateWidget extends StatelessWidget {
  const AccountStateWidget({
    Key? key,
    required this.firstText,
    required this.secondText,
    this.onTapSecondText,
  }) : super(key: key);

  final String firstText;
  final String secondText;
  final Function()? onTapSecondText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: const TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: onTapSecondText,
          child: Text(
            secondText,
            style: const TextStyle(color: kPrimaryColor, fontSize: 16),
          ),
        )
      ],
    );
  }
}
