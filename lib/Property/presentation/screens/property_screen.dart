import 'package:flutter/material.dart';
import 'package:real_estate_app/Property/data/models/property.dart';
import '../widgets/description_section.dart';
import '../widgets/image_section.dart';

class PropertyScreen extends StatelessWidget {
  final Property property;
  const PropertyScreen({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .29,
              child: ImageSection(
                property: property,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DescriptionSection(
                property: property,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
