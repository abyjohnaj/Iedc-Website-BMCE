import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final List<String> images = [
      "assets/hero1.jpg",
      "assets/hero2.jpg",
      "assets/hero3.jpg",
    ];

    return AspectRatio(
      aspectRatio: screenWidth < 800 ? 16 / 9 : 21 / 9,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          viewportFraction: 1,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
        ),
        items: images.map((image) {
          return ClipRRect(
            child: Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      ),
    );
  }
}
