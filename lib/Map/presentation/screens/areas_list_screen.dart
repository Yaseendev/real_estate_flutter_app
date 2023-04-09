import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/Map/blocs/map_bloc/map_bloc.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'initial_map_screen.dart';
import 'property_location_screen.dart';

class AreasListScreen extends StatelessWidget {
  final bool fromInit;
  const AreasListScreen({
    super.key,
    required this.fromInit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(getTranslated('areas_list', context)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => BlocProvider<MapBloc>(
                          create: (context) => MapBloc(),
                          child: fromInit
                              ? InitialMapScreen(
                                  currentLocation:
                                      const LatLng(30.0504132, 31.2073222),
                                )
                              : PropertyLocationScreen(),
                        ))),
            icon: const Icon(Icons.map),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: const Color(0xFFF6F6F6),
                filled: true,
                hintText: getTranslated('search_area', context),
                prefixIcon: const Icon(Icons.search),
              ),
              textAlignVertical: TextAlignVertical.bottom,
              //controller: textController,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...ListTile.divideTiles(
                    context: context,
                    tiles: [
                      ExpansionTile(
                        leading: const Icon(Icons.share_location),
                        title: const Text(
                          'City',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          const ListTile(
                            title: Text('Area 1'),
                          ),
                          const ListTile(
                            title: Text('Area 2'),
                          ),
                          const ListTile(
                            title: Text('Area 3'),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        leading: const Icon(Icons.share_location),
                        title: const Text(
                          'City',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          const ListTile(
                            title: Text('Area 1'),
                          ),
                          const ListTile(
                            title: Text('Area 2'),
                          ),
                          const ListTile(
                            title: Text('Area 3'),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        leading: const Icon(Icons.share_location),
                        title: const Text(
                          'City',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          const ListTile(
                            title: Text('Area 1'),
                          ),
                          const ListTile(
                            title: Text('Area 2'),
                          ),
                          const ListTile(
                            title: Text('Area 3'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
