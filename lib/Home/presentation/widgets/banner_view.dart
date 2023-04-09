import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/Utils/constants.dart';

class BannerView extends StatefulWidget {
  const BannerView({super.key});

  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  final List<String> images = [
    'https://s3.amazonaws.com/thumbnails.venngage.com/template/83840a84-2f67-4924-ac58-22d736c86712.png',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/real-estate-promotion-banner-design-template-f62fb3f094505c83064d036c3d1b7aa3_screen.jpg?ts=1647030984',
    'https://t4.ftcdn.net/jpg/00/97/87/09/360_F_97870959_eowxg3gnQUdCcWh5wWOyVXMLgQ9K25cW.jpg',
    'https://www.rismedia.com/wp-content/uploads/2019/03/real-estate-property-industry-concept-background-unique-lighting-in-picture-id983343894-1.jpg',
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width,
      height: _width * .4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              disableCenter: true,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              },
            ),
            itemCount: images.length,
            itemBuilder: (context, index, _) {
              return InkWell(
                onTap: () {},
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.assetNetwork(
                      placeholder: Images.kPlaceHolder,
                      fit: BoxFit.cover,
                      image: images[index],
                      imageErrorBuilder: (c, o, s) => Image.asset(
                        Images.kPlaceHolder,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    images.length,
                    (index) => TabPageSelectorIndicator(
                          backgroundColor: index == current
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          borderColor: index == current
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          size: 10,
                        ))),
          ),
        ],
      ),
    );
  }
}
