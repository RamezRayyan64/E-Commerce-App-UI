import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<Map<String, List<String>>> images;
  final List<Color> colors;
  final double rating, price;
  bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      {
        'color1': [
          'ps4_console_white_1',
          'ps4_console_white_2',
          'ps4_console_white_3',
          'ps4_console_white_4'
        ]
      },
      {
        'color2': [
          'ps4_console_blue_1',
          'ps4_console_blue_2',
          'ps4_console_blue_3',
          'ps4_console_blue_4',
        ]
      },
    ],
    colors: [
      Colors.white,
      const Color(0xFF836DB8),
    ],
    title: "Wireless Controller - for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      {
        'color1': ['Image Popular Product 2']
      },
    ],
    colors: [
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.99,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      {
        'color1': ['glap']
      },
    ],
    colors: [Colors.black],
    title: "Gloves XC Omega - Polygon",
    price: 36.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      {
        'color1': ['wireless headset']
      }
    ],
    colors: [
      Colors.black,
    ],
    title: "Wireless Headset - Logitech Head",
    price: 20.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 5,
    images: [
      {
        'color1': ['tshirt']
      },
    ],
    colors: [
      const Color(0xFFE1764B),
    ],
    title: "Addidas Sport - Sport T-Shirt",
    price: 5.99,
    description: description,
    rating: 4.5,
    isPopular: true,
  ),
  Product(
    id: 7,
    images: [
      {
        'color1': ['shoes2']
      },
    ],
    colors: [
      Colors.white,
    ],
    title: "Nike Sport - Black, White",
    price: 30.99,
    description: description,
    rating: 4.4,
    isPopular: true,
  ),
  Product(
    id: 8,
    images: [
      {
        'color1': ['product 1 image']
      },
    ],
    colors: [
      const Color(0xFFE6CD4E),
    ],
    title: "Relays Cloath - Home T-Shirt ",
    price: 10.99,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
