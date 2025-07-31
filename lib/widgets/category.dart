import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final Function(String) onTap;

  const CategoryFilter({
    super.key,
    required this.categories,
    required this.selected,
    required this.onTap, required String selectedCategory, required void Function(String category) onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: categories.map((cat) {
        return ChoiceChip(
          label: Text(cat),
          selected: selected == cat,
          onSelected: (_) => onTap(cat),
        );
      }).toList(),
    );
  }
}
