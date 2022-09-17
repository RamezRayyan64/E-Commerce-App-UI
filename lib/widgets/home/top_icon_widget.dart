import 'package:e_commerce_app_ui/utilities/constants.dart';
import 'package:e_commerce_app_ui/widgets/home/rounded_icon_widget.dart';
import 'package:flutter/material.dart';

class TopIconsWidget extends StatelessWidget {
  const TopIconsWidget({
    Key? key,
    required this.imageSource,
    required this.onPressed,
    required this.notificationCount,
  }) : super(key: key);

  final String imageSource;
  final Function() onPressed;
  final String notificationCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onPressed,
      child: Stack(children: [
        RoundedIconWidget(
          backgroundColor: kSecondaryColor.withOpacity(0.1),
          imageSource: imageSource,
          isMore: false,
          isBackButton: false,
          iconData: Icons.abc,
        ),
        if (notificationCount.isNotEmpty)
          Positioned(
            top: -1,
            right: -1,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  border: Border.all(width: 1, color: Colors.white),
                  shape: BoxShape.circle),
              child: Text(
                notificationCount.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
      ]),
    );
  }
}
