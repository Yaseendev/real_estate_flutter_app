import 'package:flutter/material.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Shared/Widgets/back_elv_button.dart';
import 'filter_sheet.dart';

class PropertiesSearchBar extends StatefulWidget {
  final String? category;
  const PropertiesSearchBar({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  State<PropertiesSearchBar> createState() => _PropertiesSearchBarState();
}

class _PropertiesSearchBarState extends State<PropertiesSearchBar> {
  final List<String> selectedAmenities = [];
  late final Set<String> selectedCategories;
  final List<String> selectedBedrooms = [];
  final List<String> selectedBathrooms = [];
  final List<String> selectedLevels = [];

  @override
  void initState() {
    selectedCategories = {
      if (widget.category != null) widget.category!,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BackElvButton(),
        Expanded(
          child: TextField(
            maxLines: 1,
            autofocus: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              fillColor: const Color(0xFFF6F6F6),
              filled: true,
              hintText: getTranslated('search_property', context),
              prefixIcon: const Icon(Icons.search),
            ),
            textAlignVertical: TextAlignVertical.bottom,
          ),
        ),
        SizedBox(
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(12),
                )),
                builder: (ctx) {
                  return FilterSheet(
                    categories: selectedCategories,
                    amenities: selectedAmenities,
                    bedrooms: selectedBedrooms,
                    bathrooms: selectedBathrooms,
                    levels: selectedLevels,
                  );
                },
              );
            },
            child: const Center(child: Icon(Icons.tune)),
          ),
        ),
      ],
    );
  }
}
