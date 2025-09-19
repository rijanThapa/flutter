import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryCircle extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;

  const CategoryCircle({
    super.key,
    required this.category,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? const Color(0x1A3B82F6)
                      : const Color(0x0F000000),
                  blurRadius: isSelected ? 15 : 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF3B82F6)
                    : const Color(0xFFE2E8F0),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(category.image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            category.label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? const Color(0xFF3B82F6)
                  : const Color(0xFF1E293B),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
