import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/Map/blocs/map_bloc/map_bloc.dart';
import 'package:real_estate_app/Map/data/models/address.dart';
import 'package:real_estate_app/Map/presentation/screens/initial_map_screen.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Utils/themes.dart';

class LocationHeader extends StatefulWidget {
  const LocationHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationHeader> createState() => _LocationHeaderState();
}

class _LocationHeaderState extends State<LocationHeader> {
  String locationState = 'Giza';
  String locationCity = 'Sheikh Zayed City';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (_) => BlocProvider<MapBloc>(
                      create: (context) => MapBloc(),
                      child: InitialMapScreen(
                        currentLocation: LatLng(30.0504132, 31.2073222),
                      ),
                    )))
            .then((value) {
          if (value != null) {
            print((value as Address).suburb);
            setState(() {
              locationState = value.state;
              locationCity = value.suburb;
            });
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '  ${getTranslated('location', context)}',
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.PRIMARY_COLOR,
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.PRIMARY_COLOR,
                ),
                SizedBox(width: 2),
                Expanded(
                  child: Text.rich(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(
                      text: '$locationCity, ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: locationState,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
