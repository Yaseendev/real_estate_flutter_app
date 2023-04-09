import 'package:flutter/material.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Utils/constants.dart';

class CategoryDropDownButton extends StatelessWidget {
  final ValueChanged<CategoryType> onChange;
  const CategoryDropDownButton({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
        validator: (value) {
          print(value);
          //if (value == null) return 'Matloob';
        },
        value: CategoryType.apartment,
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          hintText: getTranslated('choose_category', context),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: .2,
              color: Colors.grey,
              style: BorderStyle.none,
            ),
            borderRadius: const BorderRadius.all(const Radius.circular(12.0)),
          ),
        ),
        items: [
          DropdownMenuItem(
              value: CategoryType.apartment,
              child: Row(
                children: [
                  Icon(Icons.apartment_rounded),
                  Text('  ${getTranslated('apartment', context)}'),
                ],
              )),
          DropdownMenuItem(
            value: CategoryType.villa,
            child: Row(
              children: [
                Icon(Icons.villa_rounded),
                Text('  ${getTranslated('villa', context)}'),
              ],
            ),
          ),
          DropdownMenuItem(
            value: CategoryType.vacationHome,
            child: Row(
              children: [
                Icon(Icons.holiday_village_rounded),
                Text('  ${getTranslated('vacation_home', context)}'),
              ],
            ),
          ),
          DropdownMenuItem(
            value: CategoryType.commercial,
            child: Row(
              children: [
                Icon(Icons.store_rounded),
                Text('  ${getTranslated('commercial', context)}'),
              ],
            ),
          ),
          DropdownMenuItem(
            value: CategoryType.building,
            child: Row(
              children: [
                Icon(Icons.corporate_fare_rounded),
                Text('  ${getTranslated('building', context)}'),
              ],
            ),
          ),
          DropdownMenuItem(
            value: CategoryType.land,
            child: Row(
              children: [
                Icon(Icons.crop_portrait_rounded),
                Text('  ${getTranslated('land', context)}'),
              ],
            ),
          ),
        ],
        onChanged: (value) => onChange(value!),
      ),
    );
  }
}
