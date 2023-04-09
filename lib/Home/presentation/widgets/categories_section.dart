import 'package:flutter/material.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'category_home_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CategoryHomeCard(
            label: getTranslated('apartments', context),
            icon: Icons.apartment_rounded,
          ),
          CategoryHomeCard(
            label: getTranslated('villas', context),
            icon: Icons.villa_rounded,
          ),
          CategoryHomeCard(
            label: getTranslated('vacation_homes', context),
            icon: Icons.holiday_village_rounded,
          ),
          CategoryHomeCard(
            label: getTranslated('commercials', context),
            icon: Icons.store_rounded,
          ),
          CategoryHomeCard(
            label: getTranslated('buildings', context),
            icon: Icons.corporate_fare_rounded,
          ),
          CategoryHomeCard(
            label: getTranslated('lands', context),
            icon: Icons.crop_portrait_rounded,
          ),
        ],
      ),
    );
  }
}
