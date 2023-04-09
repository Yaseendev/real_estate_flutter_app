import 'package:flutter/material.dart';
import 'package:real_estate_app/Property/data/models/property.dart';
import 'package:real_estate_app/Search/presentation/Widgets/properties_search_bar.dart';
import 'package:real_estate_app/Utils/constants.dart';
import 'property_card.dart';

class PropertiesScreenLoaded extends StatelessWidget {
  final String? category;
  const PropertiesScreenLoaded({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PropertiesSearchBar(category: category),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                PropertyCard(
                  property: Property(
                    id: 1,
                    name: 'House Number 4',
                    description: loremIpsum,
                    price: 30000,
                    bedRooms: 3,
                    bathRooms: 2,
                    area: 200,
                    listedAt: DateTime.parse('2022-11-13T13:11:43.000000Z'),
                    imgUrls: [
                      'https://www.bhg.com/thmb/0Fg0imFSA6HVZMS2DFWPvjbYDoQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg',
                      'https://www.bhg.com/thmb/0Fg0imFSA6HVZMS2DFWPvjbYDoQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg',
                      'https://www.bhg.com/thmb/0Fg0imFSA6HVZMS2DFWPvjbYDoQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg',
                    ],
                    address: 'New Cairo - El Tagamoa, Cairo',
                    levels: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
