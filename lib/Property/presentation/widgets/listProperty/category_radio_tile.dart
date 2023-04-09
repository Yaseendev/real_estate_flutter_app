import 'package:flutter/material.dart';
import 'package:real_estate_app/Utils/constants.dart';
import 'package:real_estate_app/Utils/themes.dart';

class CategoryRadioTile extends StatelessWidget {
  final String title;
  final CategoryType category;
  final CategoryType selectedCategory;
  final Function(CategoryType value) onSelect;
  const CategoryRadioTile({
    super.key,
    required this.title,
    required this.category,
    required this.selectedCategory,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        child: RadioListTile(
          activeColor: AppColors.PRIMARY_COLOR,
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          value: category,
          title: Text(title),
          groupValue: selectedCategory,
          onChanged: (value) {
            onSelect(value!);
          },
        ),
      ),
    );
  }
}
