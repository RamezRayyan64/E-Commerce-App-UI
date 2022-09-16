import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/constants.dart';
import 'package:e_commerce/widgets/welcome/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailScrenn extends StatefulWidget {
  static const id = '/product_detail_screen';

  const ProductDetailScrenn({Key? key}) : super(key: key);

  @override
  State<ProductDetailScrenn> createState() => _ProductDetailScrennState();
}

class _ProductDetailScrennState extends State<ProductDetailScrenn> {
  dynamic map = {};
  late Product product;
  late String? currentImage;
  int index = 0;
  int indexColor = 0;
  int buyCount = 0;

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    product = map['product'];
    currentImage =
        product.images[indexColor]['color${indexColor + 1}']!.toList()[index];
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
            backgroundColor: const Color(0xFFF5F6F9),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 320,
                            child: Padding(
                              padding: const EdgeInsets.all(60.0),
                              child: Image.asset(
                                  'assets/images/$currentImage.png'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const BackIconWidget(color: Colors.white),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Text('${product.rating}'),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SvgPicture.asset(
                                        'assets/icons/Star Icon.svg')
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    product.images[indexColor]
                                            ['color${indexColor + 1}']!
                                        .toList()
                                        .length,
                                    (index) => MoreImageWidget(
                                          imageSource: product
                                              .images[indexColor]
                                                  ['color${indexColor + 1}']!
                                              .toList()[index],
                                          isEndIndex: index ==
                                                  product.images[indexColor][
                                                              'color${indexColor + 1}']!
                                                          .toList()
                                                          .length -
                                                      1
                                              ? true
                                              : false,
                                          onTap: () {
                                            setState(() {
                                              this.index = index;
                                              currentImage = product
                                                  .images[indexColor][
                                                      'color${indexColor + 1}']!
                                                  .toList()[index];
                                            });
                                          },
                                          enableBorder: this.index == index
                                              ? true
                                              : false,
                                        )),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                              child: Text(
                                product.title,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      product.isFavourite =
                                          !product.isFavourite;
                                    });
                                  },
                                  child: Container(
                                    width: 70,
                                    padding:
                                        const EdgeInsetsDirectional.all(15),
                                    decoration: BoxDecoration(
                                        color: product.isFavourite == true
                                            ? kPrimaryColor.withOpacity(0.15)
                                            : kSecondaryColor.withOpacity(0.1),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    child: SvgPicture.asset(
                                      'assets/icons/Heart Icon_2.svg',
                                      color: product.isFavourite == true
                                          ? const Color(0xFFFF4848)
                                          : const Color(0xFFDBDEE4),
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 70, top: 5, bottom: 20),
                              child: Text(
                                product.description,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: kSecondaryColor.withOpacity(0.1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(
                                  product.colors.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            indexColor = index;
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: indexColor == index
                                                      ? kPrimaryColor
                                                      : Colors.transparent),
                                              shape: BoxShape.circle),
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: product.colors[index],
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                      )),
                            ),
                            Row(
                              children: [
                                BuyCountCounterWidget(
                                    onTap: () {
                                      setState(() {
                                        if (buyCount > 0) {
                                          buyCount--;
                                        }
                                      });
                                    },
                                    iconData: Icons.remove),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('$buyCount',
                                    style: const TextStyle(
                                        fontSize: 25, color: kPrimaryColor)),
                                const SizedBox(
                                  width: 10,
                                ),
                                BuyCountCounterWidget(
                                    onTap: () {
                                      setState(() {
                                        buyCount++;
                                      });
                                    },
                                    iconData: Icons.add),
                              ],
                            )
                          ]),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: RoundedButtonWidget(
                            text: 'Add to cart',
                            onPressed: () {},
                          )),
                    )
                  ],
                ),
              ),
            )));
  }
}

class BackIconWidget extends StatelessWidget {
  const BackIconWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class BuyCountCounterWidget extends StatelessWidget {
  const BuyCountCounterWidget(
      {Key? key, required this.onTap, required this.iconData})
      : super(key: key);

  final Function() onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        height: 50,
        width: 50,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(iconData),
      ),
    );
  }
}

class MoreImageWidget extends StatelessWidget {
  const MoreImageWidget({
    Key? key,
    required this.isEndIndex,
    required this.imageSource,
    required this.onTap,
    required this.enableBorder,
  }) : super(key: key);

  final bool isEndIndex;
  final String imageSource;
  final Function() onTap;
  final bool enableBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, isEndIndex == true ? 0 : 10, 0),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
                color:
                    enableBorder == true ? kPrimaryColor : Colors.transparent,
                width: 1),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Image.asset(
            'assets/images/$imageSource.png',
          ),
        ),
      ),
    );
  }
}
