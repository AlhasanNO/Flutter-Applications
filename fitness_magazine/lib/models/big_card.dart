import 'package:flutter/material.dart';

class BigCard {
  BigCard({
    required this.image,
    required this.category,
    required this.categoryColor,
    required this.headingText,
    required this.paragraph,
  });

  String image;
  String category;
  Color categoryColor;
  String headingText;
  String paragraph;
}