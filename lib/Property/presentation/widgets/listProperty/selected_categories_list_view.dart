import 'package:flutter/material.dart';
import 'package:real_estate_app/Utils/constants.dart';
import 'category_radio_tile.dart';

class SelectedCategoriesListView extends StatefulWidget {
  final CategoryType category;
  final Function(CategoryType value) onSelect;
  const SelectedCategoriesListView({
    super.key,
    required this.category,
    required this.onSelect,
  });

  @override
  State<SelectedCategoriesListView> createState() =>
      _SelectedCategoriesListViewState();
}

class _SelectedCategoriesListViewState
    extends State<SelectedCategoriesListView> {
  CategoryType selectedCategory = CategoryType.apartment;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: [
        CategoryRadioTile(
          title: 'Apartment',
          category: CategoryType.apartment,
          selectedCategory: selectedCategory,
          onSelect: (value) {
            widget.onSelect(value);
            setState(() => selectedCategory = value);
          },
        ),
        CategoryRadioTile(
          title: 'Villa',
          category: CategoryType.villa,
          selectedCategory: selectedCategory,
          onSelect: (value) {
            widget.onSelect(value);
            setState(() => selectedCategory = value);
          },
        ),
        CategoryRadioTile(
          title: 'Vacation Home',
          category: CategoryType.vacationHome,
          selectedCategory: selectedCategory,
          onSelect: (value) {
            widget.onSelect(value);
            setState(() => selectedCategory = value);
          },
        ),
        CategoryRadioTile(
          title: 'Commercial',
          category: CategoryType.commercial,
          selectedCategory: selectedCategory,
          onSelect: (value) {
            widget.onSelect(value);
            setState(() => selectedCategory = value);
          },
        ),
        CategoryRadioTile(
          title: 'Building',
          category: CategoryType.building,
          selectedCategory: selectedCategory,
          onSelect: (value) {
            widget.onSelect(value);
            setState(() => selectedCategory = value);
          },
        ),
        CategoryRadioTile(
          title: 'Land',
          category: CategoryType.land,
          selectedCategory: selectedCategory,
          onSelect: (value) {
            widget.onSelect(value);
            setState(() => selectedCategory = value);
          },
        ),
      ],
    );
  }
}
