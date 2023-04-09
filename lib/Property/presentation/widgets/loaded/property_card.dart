import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:real_estate_app/Property/data/models/property.dart';
import 'package:real_estate_app/Property/presentation/screens/property_screen.dart';
import 'package:real_estate_app/Utils/constants.dart';
import 'package:real_estate_app/Utils/themes.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  const PropertyCard({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => PropertyScreen(
                  property: property,
                ))),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        leading: CachedNetworkImage(
          imageUrl: property.imgUrls[0],
          height: 120,
          width: 90,
          fit: BoxFit.cover,
          errorWidget: (context, error, stackTrace) {
            return Image.asset(
              Images.kPlaceHolder,
              height: 120,
              width: 90,
              fit: BoxFit.cover,
            );
          },
          placeholder: (context, _) {
            return Image.asset(
              Images.kPlaceHolder,
              height: 120,
              width: 90,
              fit: BoxFit.cover,
            );
          },
        ),
        title: Text(
          property.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text.rich(
              TextSpan(
                text:
                    intl.NumberFormat.decimalPattern().format(property.price) +
                        ' EGP',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '/Per Month',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.bed_rounded,
                      color: AppColors.PRIMARY_COLOR,
                    ),
                    SizedBox(width: 4),
                    Text(
                      property.bedRooms.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.bathtub_rounded,
                      color: AppColors.PRIMARY_COLOR,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${property.bathRooms}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Icon(Icons
                //         .directions_car_filled_outlined),
                //     SizedBox(width: 4),
                //     Text('1'),
                //   ],
                // ),
                Row(
                  children: [
                    Icon(
                      Icons.aspect_ratio_outlined,
                      color: AppColors.PRIMARY_COLOR,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${property.area}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'New Cairo - El Tagamoa, Cairo . ${property.getTimeDifference()} ago',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.star),
      ),
    );
  }
}
