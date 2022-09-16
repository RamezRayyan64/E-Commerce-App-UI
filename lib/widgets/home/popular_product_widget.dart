import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularProductWidget extends StatelessWidget {
  const PopularProductWidget({
    Key? key,
    required this.onPressFavorite,
    required this.onTapItem,
    required this.isEndIndex,
    required this.product,
  }) : super(key: key);

  final Function() onPressFavorite;
  final Function() onTapItem;
  final bool isEndIndex;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapItem,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, isEndIndex == true ? 0 : 10, 0),
        child: SizedBox(
          width: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration:
                        BoxDecoration(color: kSecondaryColor.withOpacity(0.1)),
                    child: Image.asset(
                        'assets/images/${product.images[0]['color1']!.toList()[0]}.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                product.title,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${product.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: kPrimaryColor,
                      )),
                  GestureDetector(
                    onTap: onPressFavorite,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: product.isFavourite == true
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/Heart Icon_2.svg',
                        color: product.isFavourite == true
                            ? const Color(0xFFFF4848)
                            : const Color(0xFFDBDEE4),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
