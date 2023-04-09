import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_app/Property/data/models/property.dart';
import 'package:real_estate_app/Property/presentation/screens/property_screen.dart';
import 'package:real_estate_app/Utils/constants.dart';
import 'package:real_estate_app/Utils/themes.dart';
import 'package:intl/intl.dart' as intl;

class HomeHouseCard extends StatelessWidget {
  final Property property;
  const HomeHouseCard({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => PropertyScreen(
                property: property,
              ))),
      child: SizedBox(
        width: 176.sp,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    width: 180.sp,
                    height: 120.sp,
                    imageUrl: property.imgUrls.first,
                    //'https://www.bhg.com/thmb/0Fg0imFSA6HVZMS2DFWPvjbYDoQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg',
                    placeholder: (context, url) => Image.asset(
                      Images.kPlaceHolder,
                      width: double.maxFinite,
                      fit: BoxFit.fill,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      Images.kPlaceHolder,
                      width: double.maxFinite,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  title: Text(
                    property.name,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            '${property.bedRooms}',
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
                            style: TextStyle(
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
                  style: ListTileStyle.drawer,
                ),
                Text.rich(
                  TextSpan(
                    text: intl.NumberFormat.compactSimpleCurrency(name: 'EGP')
                        .format(property.price),
                    //'3,500 EGP',
                    style: TextStyle(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
