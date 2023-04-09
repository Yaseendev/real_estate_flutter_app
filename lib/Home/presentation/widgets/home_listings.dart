import 'package:flutter/material.dart';
import 'package:real_estate_app/Property/data/models/property.dart';
import 'package:real_estate_app/Utils/constants.dart';
import 'home_house_card.dart';

class HomeListings extends StatelessWidget {
  final String sectionName;
  const HomeListings({
    Key? key,
    required this.sectionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            sectionName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeHouseCard(
                property: Property(
                  id: 1,
                  name: 'House Number 1',
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
                  levels: 1,
                ),
              ),
              HomeHouseCard(
                property: Property(
                  id: 2,
                  name: 'Sweet House 2',
                  description: loremIpsum,
                  price: 35000,
                  bedRooms: 3,
                  bathRooms: 3,
                  area: 230,
                  listedAt: DateTime.parse('2022-11-13T13:11:43.000000Z'),
                  imgUrls: [
                    'https://img.staticmb.com/mbcontent//images/uploads/2022/12/Most-Beautiful-House-in-the-World.jpg',
                    'https://www.bhg.com/thmb/0Fg0imFSA6HVZMS2DFWPvjbYDoQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg',
                    'https://www.bhg.com/thmb/0Fg0imFSA6HVZMS2DFWPvjbYDoQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg',
                  ],
                  address: 'New Cairo - El Rehab, Cairo',
                  levels: 3,
                ),
              ),
              HomeHouseCard(
                property: Property(
                  id: 3,
                  name: 'Sweet House 3',
                  description: loremIpsum,
                  price: 40000,
                  bedRooms: 4,
                  bathRooms: 3,
                  area: 255,
                  listedAt: DateTime.parse('2022-11-13T13:11:43.000000Z'),
                  imgUrls: [
                    'https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/home-improvement/wp-content/uploads/2022/07/download-23.jpg',
                    'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?cs=srgb&dl=pexels-binyamin-mellish-106399.jpg&fm=jpg',
                    'https://losangelesgeneralcontractor.com/wp-content/uploads/2017/12/building-a-house-in-los-angeles.jpg',
                  ],
                  address: 'New Cairo - El Tagamoa, Cairo',
                  levels: 3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
