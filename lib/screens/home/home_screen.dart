import 'package:e_commerce_app_ui/models/product.dart';
import 'package:e_commerce_app_ui/screens/cart/cart_screen.dart';
import 'package:e_commerce_app_ui/screens/home/product_detail_screen.dart';
import 'package:e_commerce_app_ui/screens/profile/profile_screen.dart';
import 'package:e_commerce_app_ui/utilities/constants.dart';
import 'package:e_commerce_app_ui/utilities/size_config.dart';
import 'package:e_commerce_app_ui/widgets/home/catigory_widget.dart';
import 'package:e_commerce_app_ui/widgets/home/collection_widget.dart';
import 'package:e_commerce_app_ui/widgets/home/popular_product_widget.dart';
import 'package:e_commerce_app_ui/widgets/home/special_for_you_widget.dart';
import 'package:e_commerce_app_ui/widgets/home/top_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static const id = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currextIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ProfileScreen.id);
                          },
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/Profile image.png'),
                            radius: 25,
                          )
                          // Container(
                          //   width: 50,
                          //   height: 50,
                          //   child: Image.asset('assets/images/Profile image.png'),
                          //   decoration: BoxDecoration(
                          //       color: Color(0xFFF5F6F9),
                          //       borderRadius: BorderRadius.circular(5)),
                          // ),
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
                        onPressed: () {
                          Navigator.pushNamed(context, CartScreen.id);
                        },
                        notificationCount: '3',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF4F3892),
                  ),
                  child: const Text.rich(TextSpan(
                      text: 'A Summer Surprise\n',
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                            text: 'Cashbook 20%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold))
                      ])),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CatigoriesWidget(
                      carigoryName: 'Flash Deal',
                      imageSource: 'Flash Icon',
                      isMore: false,
                    ),
                    CatigoriesWidget(
                      carigoryName: 'Bill',
                      imageSource: 'Bill Icon',
                      isMore: false,
                    ),
                    CatigoriesWidget(
                      carigoryName: 'Gome',
                      imageSource: 'Game Icon',
                      isMore: false,
                    ),
                    CatigoriesWidget(
                      carigoryName: 'Daily Gift',
                      imageSource: 'Gift Icon',
                      isMore: false,
                    ),
                    CatigoriesWidget(
                      carigoryName: 'More',
                      imageSource: 'Discover',
                      isMore: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CollectionWidget(
                  title: 'Special for you',
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SpecialForYouWidget(
                      imageSource: 'Image Banner 2',
                      upperText: 'Smartphone',
                      numOfBrands: 18,
                      onPressed: () {},
                      isEndIndex: false,
                      isFullWidth: false,
                      isSeeMore: false,
                    ),
                    SpecialForYouWidget(
                      imageSource: 'Image Banner 3',
                      upperText: 'Fashion',
                      numOfBrands: 24,
                      onPressed: () {},
                      isEndIndex: true,
                      isFullWidth: false,
                      isSeeMore: false,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CollectionWidget(
                  title: 'Popular products',
                  children: List.generate(4, (index) {
                    return Row(
                      children: [
                        SizedBox(
                          width: index == 0 ? 20 : 0,
                        ),
                        PopularProductWidget(
                          product: demoProducts[index],
                          onPressFavorite: () {
                            setState(() {
                              demoProducts[index].isFavourite =
                                  !demoProducts[index].isFavourite;
                            });
                          },
                          onTapItem: () {
                            Navigator.pushNamed(context, ProductDetailScrenn.id,
                                arguments: {'product': demoProducts[index]});
                          },
                          isEndIndex:
                              index == demoProducts.length - 1 ? true : false,
                        ),
                        SizedBox(
                          width: index == demoProducts.length - 1 ? 20 : 0,
                        ),
                      ],
                    );
                  }),
                ),
              ]),
            ),
          ),
        ));
  }
}
