import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description, brand;
  final List<String> images;
  final List<Color> colors;
  final List<int> sizes;

  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    required this.sizes,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.brand,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
      id: 1,
      images: [
        "assets/images/product_image1.png",
        "assets/images/product_image1_1.png",
        "assets/images/product_image1_2.png",
        "assets/images/product_image1_3.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      sizes: [35, 36, 37, 38],
      title: "Air Jordan 1 Mid-Paris White™",
      price: 64.99,
      description: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
      brand: 'Nike'),
  Product(
      id: 2,
      images: [
        "assets/images/product_image2.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      sizes: [35, 36],
      title: "Air Jordan 1 Mid – Wolf Grey",
      price: 50.5,
      description: description,
      rating: 4.1,
      isPopular: true,
      brand: 'Nike'),
  Product(
      id: 3,
      images: [
        "assets/images/product_image3.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      sizes: [38, 39, 40, 41],
      title: "Air Jordan 1 Mid – Wolf Grey",
      price: 36.55,
      description: description,
      rating: 4.1,
      isFavourite: true,
      isPopular: true,
      brand: 'Nike'),
  Product(
    id: 4,
    images: [
      "assets/images/product_image4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    sizes: [35, 36, 37, 38],
    title: "Air Jordan 1 Mid – Wolf Grey",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    brand: 'Nike',
  ),
];

const String description =
    "Giày AKKA ACTIVE B2221 là phiên bản ACTIVE tiếp theo được ra mắt của thương hiệu AKKA...";

class Category {
  final String icon, text;
  final String? type;

  Category({required this.icon, required this.text, this.type = 'item'});
}

List<Category> categories = [
  Category(icon: "assets/icons/puma_icon.svg", text: 'Puma'),
  Category(icon: "assets/icons/nike_icon.svg", text: 'Nike'),
  Category(icon: "assets/icons/adidas_icon.svg", text: 'Adidas'),
  // Category(icon: "assets/icons/puma_icon.svg", text: 'Puma'),
  // Category(icon: "assets/icons/nike_icon.svg", text: 'Nike'),
  // Category(icon: "assets/icons/adidas_icon.svg", text: 'Adidas'),
];
