import 'package:e_commerce/models/product.dart';

class Cart {
  final Product product;
  final int itemNoCount;

  Cart({
    required this.product,
    required this.itemNoCount,
  });
}

List<Cart> demoCart = [
  Cart(product: demoProducts[0], itemNoCount: 1),
  Cart(product: demoProducts[1], itemNoCount: 3),
  Cart(product: demoProducts[2], itemNoCount: 2),
];

double getTotalPrice() {
  double totalPrice = 0;
  for (var i = 0; i < demoCart.length; i++) {
    totalPrice += demoCart[i].product.price * demoCart[i].itemNoCount;
  }
  return totalPrice;
}
