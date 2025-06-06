import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryCircle extends StatelessWidget {
  final CategoryModel category;

  const CategoryCircle({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: AssetImage(category.image),
        ),
        const SizedBox(height: 8),
        Text(
          category.label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
