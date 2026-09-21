import 'package:flutter/material.dart';

class MenuModel {
  final String id;
  final String name;
  final String category;
  final int price;
  final int? originalPrice;
  final double rating;
  final int reviewCount;
  final String? badgeText;
  final IconData icon;
  final String imageUrl;
  final String description;
  final bool isAvailable;
  final String cookingTime;
  final String portion;
  final String spiceLevel;
  final List<String> composition;

  const MenuModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.originalPrice,
    required this.rating,
    required this.reviewCount,
    this.badgeText,
    required this.icon,
    required this.imageUrl,
    required this.description,
    this.isAvailable = true,
    this.cookingTime = '10–15 Mnt',
    this.portion = '1 Porsi Pas',
    this.spiceLevel = 'Level 0 – 5',
    this.composition = const [],
  });
}
