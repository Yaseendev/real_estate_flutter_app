import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/Map/blocs/map_bloc/map_bloc.dart';
import 'package:real_estate_app/Map/data/repositories/map_repo.dart';
import 'package:real_estate_app/Property/data/models/property.dart';
import 'package:real_estate_app/Property/presentation/widgets/loaded/property_card.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Utils/constants.dart';
import 'package:real_estate_app/Utils/locator.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late final GoogleMapController googleMapController;
  late final Set<Marker> markers = Set<Marker>();
  bool isSelected = false;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    loadAssets();
    super.initState();
  }

  void loadAssets() async {
    final imgData = await DefaultAssetBundle.of(context)
        .load('assets/images/house_pin.png');
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId('marker'),
          icon: BitmapDescriptor.fromBytes(
            imgData.buffer.asUint8List(),
            size: const Size(60, 60),
          ),
          draggable: false,
          position: const LatLng(30.0504132, 31.2073222),
          onTap: () => setState(() => isSelected = true),
        ),
      );
    });
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapBloc, MapState>(
      listener: (context, state) {
        if (state is MapCurrentLocation) {
          if (state.curentLocation != null) {
            googleMapController
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(state.curentLocation!.latitude,
                  state.curentLocation!.longitude),
              zoom: 15,
            )));
          }
        } else if (state is MapError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 2),
            content: ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              // dense: true,
              leading: Icon(Icons.info_rounded),
              title: Text(getTranslated('err_msg', context)),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
          ));
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: TypeAheadField(
            errorBuilder: (context, error) {
              return Container();
            },
            textFieldConfiguration: TextFieldConfiguration(
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Color(0xFFF6F6F6),
                filled: true,
                hintText: getTranslated('search_area', context),
                prefixIcon: Icon(Icons.search),
              ),
              textAlignVertical: TextAlignVertical.bottom,
              controller: textController,
            ),
            suggestionsCallback: (pattern) async {
              print(pattern);
              //if (pattern.isEmpty) return Future.value();
              return await locator
                  .get<MapRepository>()
                  .getLoactionSearchResult(pattern);
              //await BackendService.getSuggestions(pattern);
            },
            autoFlipDirection: true,
            itemBuilder: (context, suggestion) {
              return ListTile(
                leading: Icon(Icons.location_on_rounded),
                title: Text(suggestion.displayPlace),
                subtitle: Text(
                    '${suggestion.address.road} ${suggestion.address.state} ${suggestion.address.country}'),
              );
            },
            //  onChanged: (value) => searchText = value,
            onSuggestionSelected: (suggestion) {
              googleMapController.animateCamera(CameraUpdate.newLatLng(
                LatLng(suggestion.position.latitude,
                    suggestion.position.longitude),
              ));
              textController.text = suggestion.displayPlace;
            },
            // keepSuggestionsOnLoading: false,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(14),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(30.0504132, 31.2073222), //TODO: Change later
                zoom: 12.5,
              ),
              onMapCreated: (gController) {
                googleMapController = gController;
              },
              onTap: (pos) {
                print('Location $pos');
                googleMapController.animateCamera(CameraUpdate.newLatLng(pos));
                setState(() => isSelected = false);
              },
              markers: markers,
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: isSelected
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: PropertyCard(
                            property: Property(
                              id: 1,
                              name: 'House Number 5',
                              description: loremIpsum,
                              price: 30000,
                              bedRooms: 3,
                              bathRooms: 2,
                              area: 200,
                              listedAt:
                                  DateTime.parse('2022-11-13T13:11:43.000000Z'),
                              imgUrls: [
                                'https://www.bhg.com/thmb/0Fg0imFSA6HVZMS2DFWPvjbYDoQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg',
                                'https://www.bhg.com/thmb/0Fg0imFSA6HVZMS2DFWPvjbYDoQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg',
                                'https://www.bhg.com/thmb/0Fg0imFSA6HVZMS2DFWPvjbYDoQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg',
                              ],
                              address: 'New Cairo - El Tagamoa, Cairo',
                              levels: 2,
                            ),
                          ),
                        ),
                        SizedBox(width: 70),
                      ],
                    )
                  : Container(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 5,
          onPressed: () {
            // if (!(context.read<MapBloc>().state is MapLoading))
            context.read<MapBloc>().add(LoadCurrentLocation());
          },
          child: Icon(
            Icons.gps_fixed,
            size: 28,
          ),
        ),
      ),
    );
  }
}
