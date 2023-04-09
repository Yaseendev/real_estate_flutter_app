import 'package:flutter/material.dart';
import 'package:real_estate_app/Property/data/models/property.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'seller_card.dart';
import 'specs_card.dart';
import 'package:intl/intl.dart' as intl;

class DescriptionSection extends StatelessWidget {
  final Property property;
  const DescriptionSection({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
      elevation: 5,
      child: Container(
        height: MediaQuery.of(context).size.height * .63,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                ' ${property.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Row(
                  children: [
                    Icon(Icons.location_pin),
                    Text(property.address),
                  ],
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text.rich(
                  TextSpan(
                    text: intl.NumberFormat.compactCurrency(name: 'EGP')
                        .format(property.price),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '\nPer Month',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            ///Specs Section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                left: 4,
                bottom: 8,
              ),
              child: Row(
                children: [
                  SpecsCard(
                    icon: Icons.bed_rounded,
                    label: getTranslated('bedrooms', context),
                    number: property.bedRooms,
                  ),
                  SpecsCard(
                    number: property.bathRooms,
                    icon: Icons.bathtub_rounded,
                    label: getTranslated('bathrooms', context),
                  ),
                  SpecsCard(
                    number: property.levels,
                    icon: Icons.density_medium_rounded,
                    label: getTranslated('levels', context),
                  ),
                ],
              ),
            ),

            //Description Section
            ListTile(
              title: Text(
                getTranslated('description', context),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(property.description),
              ),
            ),

            SellerCard(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
