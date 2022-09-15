import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Row errorWidget({String? errorText}) {
  return Row(
    children: [
      SvgPicture.asset(
        'assets/icons/Error.svg',
        height: 15,
        width: 15,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(errorText.toString())
    ],
  );
}
