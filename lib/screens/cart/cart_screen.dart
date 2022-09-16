import 'package:e_commerce/models/Cart.dart';
import 'package:e_commerce/utilities/constants.dart';
import 'package:e_commerce/widgets/welcome/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  static const id = '/cart_screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

int length = 3;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text('Your Cart', style: TextStyle(color: Colors.black)),
            Text('${demoCart.length} items')
          ],
        ),
      ),
      body: Column(
        children: List.generate(
          demoCart.length,
          (index) => Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCart.removeAt(index);
                });
              },
              key: Key(demoCart[index].product.id.toString()),
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFFFFE6E6)),
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/Trash.svg',
                      height: 30,
                      width: 30,
                    )
                  ],
                ),
              ),
              child: CartItemWidget(
                cart: demoCart[index],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, -10),
                  blurRadius: 20,
                  color: const Color(0xFFDADADA).withOpacity(0.5))
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: SvgPicture.asset('assets/icons/receipt.svg'),
                ),
                const Spacer(),
                const Text('Add voucher code'),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                      text: 'Total:\n',
                      style: const TextStyle(fontSize: 16),
                      children: [
                        TextSpan(
                            text: '\$${getTotalPrice().toStringAsFixed(2)}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20))
                      ]),
                ),
                SizedBox(
                  width: 200,
                  child: RoundedButtonWidget(
                    text: 'Check Out',
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFF5F6F9),
          ),
          child: Image.asset(
              'assets/images/${cart.product.images[0]['color1']!.toList()[0]}.png'),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              maxLines: 2,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(TextSpan(
                text: '\$${cart.product.price}',
                style: const TextStyle(color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: ' x${cart.itemNoCount}',
                      style: const TextStyle(color: kTextColor))
                ]))
          ],
        )
      ],
    );
  }
}
