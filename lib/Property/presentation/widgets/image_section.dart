import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:real_estate_app/Property/data/models/property.dart';
import 'package:real_estate_app/Shared/Widgets/back_elv_button.dart';
import 'package:real_estate_app/Utils/constants.dart';
import 'package:real_estate_app/Utils/themes.dart';

class ImageSection extends StatefulWidget {
  final Property property;
  const ImageSection({
    super.key,
    required this.property,
  });

  @override
  State<ImageSection> createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageSlideshow(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .32,
          children: widget.property.imgUrls
              .map((imgUrl) => CachedNetworkImage(
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .32,
                    imageUrl: imgUrl,
                    placeholder: (context, url) => Image.asset(
                      Images.kPlaceHolder,
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * .32,
                      fit: BoxFit.fill,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      Images.kPlaceHolder,
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * .32,
                      fit: BoxFit.fill,
                    ),
                  ))
              .toList(),
          indicatorColor: AppColors.PRIMARY_COLOR,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const BackElvButton(),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 6.0,
              bottom: 14,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                shape: MaterialStateProperty.all(
                  CircleBorder(),
                ),
                padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {},
              child: Icon(
                Icons.favorite_outline_rounded,
                size: 35,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
