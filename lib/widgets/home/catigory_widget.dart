import 'package:e_commerce/widgets/home/rounded_icon_widget.dart';
import 'package:flutter/material.dart';

class CatigoriesWidget extends StatelessWidget {
  const CatigoriesWidget({
    Key? key,
    required this.imageSource,
    required this.carigoryName,
    required this.isMore,
  }) : super(key: key);

  final String imageSource;
  final String carigoryName;
  final bool isMore;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      child: Column(
        children: [
          RoundedIconWidget(
            backgroundColor: const Color(0xFFFFECDF),
            imageSource: imageSource,
            isMore: isMore,
            isBackButton: false,
            iconData: Icons.category,
          ),
          Text(
            carigoryName,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
