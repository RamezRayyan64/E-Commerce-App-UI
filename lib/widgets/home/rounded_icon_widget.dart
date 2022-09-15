import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedIconWidget extends StatelessWidget {
  const RoundedIconWidget({
    Key? key,
    required this.imageSource,
    required this.backgroundColor,
    required this.isMore,
    required this.iconData,
    required this.isBackButton,
  }) : super(key: key);

  final String imageSource;
  final Color backgroundColor;
  final bool isBackButton;
  final bool isMore;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isMore == true
          ? 6
          : isBackButton == true
              ? 0
              : 12),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(15)),
      // ignore: unnecessary_null_comparison
      child: imageSource != null
          ? SvgPicture.asset(
              'assets/icons/$imageSource.svg',
            )
          : Icon(iconData),
    );
  }
}
