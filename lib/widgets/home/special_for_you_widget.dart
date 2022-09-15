import 'package:flutter/material.dart';

class SpecialForYouWidget extends StatelessWidget {
  const SpecialForYouWidget({
    Key? key,
    required this.imageSource,
    required this.upperText,
    required this.numOfBrands,
    required this.onPressed,
    required this.isEndIndex,
    required this.isFullWidth,
    required this.isSeeMore,
  }) : super(key: key);

  final String imageSource;
  final String upperText;
  final int numOfBrands;
  final Function() onPressed;
  final bool isEndIndex;
  final bool isFullWidth;
  final bool isSeeMore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            0,
            0,
            isEndIndex == true
                ? 0
                : isSeeMore == true
                    ? 0
                    : 10,
            0),
        child: SizedBox(
          height: isFullWidth == true ? 154 : 100,
          width: isFullWidth == true ? double.infinity : 240,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(children: [
              Image.asset(
                'assets/images/$imageSource.png',
                fit: BoxFit.cover,
              ),
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                    const Color(0xFF343434).withOpacity(0.4),
                    const Color(0xFF343434).withOpacity(0.15)
                  ]))),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text.rich(TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                          text: '$upperText\n',
                          style: TextStyle(
                              fontSize: isFullWidth == true ? 40 : 20)),
                      TextSpan(
                          text: '$numOfBrands Brands',
                          style: TextStyle(
                              fontSize: isFullWidth == true ? 25 : 16))
                    ])),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
