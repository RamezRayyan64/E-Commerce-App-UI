import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/SpecialForYouModel.dart';
import 'package:e_commerce/screens/home/product_detail_screen.dart';
import 'package:e_commerce/utilities/constants.dart';
import 'package:e_commerce/utilities/size_config.dart';
import 'package:e_commerce/widgets/home/special_for_you_widget.dart';
import 'package:e_commerce/widgets/home/top_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeeMoreScreen extends StatefulWidget {
  static const id = '/see_more_screen';

  const SeeMoreScreen({Key? key}) : super(key: key);

  @override
  State<SeeMoreScreen> createState() => _SeeMoreScreenState();
}

class _SeeMoreScreenState extends State<SeeMoreScreen> {
  dynamic map = {};

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    final from = map['from'];
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackIconWidget(
                        color: kSecondaryColor.withOpacity(0.1),
                      ),
                      Container(
                        width: SizeConfig.screenWidth! * 0.6,
                        height: 50,
                        decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15)),
                        child: const TextField(
                          decoration: InputDecoration(
                              hintText: 'Search Product',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                              )),
                        ),
                      ),
                      TopIconsWidget(
                        imageSource: 'Cart Icon',
                        onPressed: () {},
                        notificationCount: '',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                from == 'specialForYou'
                    ? Column(
                        children: List.generate(
                            specialForYouModelList.length,
                            (index) => Container(
                                  margin: EdgeInsetsDirectional.only(
                                      top: index == 0 ? 0 : 20),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: SpecialForYouWidget(
                                    imageSource: specialForYouModelList[index]
                                        .imageSource,
                                    upperText:
                                        specialForYouModelList[index].title,
                                    numOfBrands: specialForYouModelList[index]
                                        .numberOfBrands,
                                    isFullWidth: true,
                                    isSeeMore: true,
                                    isEndIndex: false,
                                    onPressed: () {},
                                  ),
                                )),
                      )
                    : Column(
                        children: List.generate(
                            demoProducts.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ProductDetailScrenn.id,
                                        arguments: {
                                          'product': demoProducts[index]
                                        });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 20, 20),
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Container(
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  color: kSecondaryColor
                                                      .withOpacity(0.1)),
                                              child: Image.asset(
                                                'assets/images/${demoProducts[index].images[0]['color1']!.toList()[0]}.png',
                                                width: 100,
                                                height: 100,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${demoProducts[index].title.split(' - ')[0]}\n${demoProducts[index].title.split(' - ')[1]}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      '\$${demoProducts[index].price}',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20,
                                                        color: kPrimaryColor,
                                                      )),
                                                  const SizedBox(
                                                    width: 100,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        demoProducts[index]
                                                                .isFavourite =
                                                            !demoProducts[index]
                                                                .isFavourite;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      width: 28,
                                                      height: 28,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: demoProducts[
                                                                        index]
                                                                    .isFavourite ==
                                                                true
                                                            ? kPrimaryColor
                                                                .withOpacity(
                                                                    0.15)
                                                            : kSecondaryColor
                                                                .withOpacity(
                                                                    0.1),
                                                      ),
                                                      child: SvgPicture.asset(
                                                        'assets/icons/Heart Icon_2.svg',
                                                        color: demoProducts[
                                                                        index]
                                                                    .isFavourite ==
                                                                true
                                                            ? const Color(
                                                                0xFFFF4848)
                                                            : const Color(
                                                                0xFFDBDEE4),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      )
              ]),
            ),
          ),
        ));
  }
}
