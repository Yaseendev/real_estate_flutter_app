import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/Search/presentation/Widgets/sort_chip.dart';
import 'package:real_estate_app/Utils/themes.dart';

class AmenitiesDropdown extends StatelessWidget {
  final ValueChanged<List<String>> onChange;
  const AmenitiesDropdown({
required this.onChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection(
      items: [
        'Balcony',
        'Pool',
        'Security',
      ],
      popupProps: PopupPropsMultiSelection.modalBottomSheet(
        itemBuilder: (context, item, isSelected) =>
            ListTile(title: Text(item)),
        modalBottomSheetProps: ModalBottomSheetProps(
            shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        )),
        selectionWidget: (context, item, isSelected) => Checkbox(
          value: isSelected,
          onChanged: (v) {},
          activeColor: AppColors.PRIMARY_COLOR,
        ),
      ),
      clearButtonProps: ClearButtonProps(
        isVisible: true,
      ),
      dropdownBuilder: (context, selectedItems) => selectedItems.isEmpty
          ? Container()
          : Wrap(
              spacing: 5,
              children: selectedItems
                  .map((e) => SortChip(
                        selected: true,
                        label: e,
                        onSelect: (value) {},
                      ))
                  .toList(),
            ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        )),
      ),
      onChanged: onChange,
    );
  }
}