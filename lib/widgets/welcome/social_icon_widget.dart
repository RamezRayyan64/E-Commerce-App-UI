import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({
    Key? key,
    required this.imageSource,
  }) : super(key: key);

  final String imageSource;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        color: Color(0xFFF5F6F9),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset(
          'assets/icons/$imageSource.svg',
        ),
      ),
    );
  }
}
